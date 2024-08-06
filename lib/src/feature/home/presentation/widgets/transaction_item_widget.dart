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

    return ListTile(
      leading: Icon(
        transaction.type == "1" ? Icons.money_off : Icons.money_off_outlined,
        color: transaction.type == "1" ? Colors.green : Colors.red,
      ),
      title: Text(homeVM.categoryNameById(transaction.categoryId)),
      trailing: Text(
        transaction.type == "2"
            ? '${double.tryParse(transaction.amount)?.toStringAsFixed(2)}'
            : '${double.tryParse(transaction.amount)?.toStringAsFixed(2)}',
        style: TextStyle(
          color: transaction.type == "2" ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
