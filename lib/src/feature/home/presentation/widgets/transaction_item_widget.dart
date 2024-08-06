import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/entity/expense_model.dart';
import '../../view_model/home_vm.dart';

class TransactionItemWidget extends ConsumerWidget {
  final Transaction transaction;

  const TransactionItemWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVM = ref.watch(homeVMProvider);

    return Dismissible(
      key: Key(transaction.id.toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          // Delete action
          final bool? confirmDelete = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Confirm Delete'),
              content: const Text('Are you sure you want to delete this transaction?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Delete'),
                ),
              ],
            ),
          );

          if (confirmDelete == true) {
            await homeVM.deleteTransaction(transaction.id);
          }

          return confirmDelete ?? false;
        } else if (direction == DismissDirection.endToStart) {
          // Show alert dialog about the edit action
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Edit not available'),
              content: const Text('The edit action is not available at the backend. Please update app backend to use this feature.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          return false;
        }
        return false;
      },
      child: ListTile(
        leading: Icon(
          transaction.type == "1" ? Icons.money_off : Icons.money_off_outlined,
          color: transaction.type == "1" ? Colors.green : Colors.red,
        ),
        title: Text(homeVM.categoryNameById(transaction.categoryId)),
        trailing: Text(
          '${double.tryParse(transaction.amount)?.toStringAsFixed(2)}',
          style: TextStyle(
            color: transaction.type == "2" ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
