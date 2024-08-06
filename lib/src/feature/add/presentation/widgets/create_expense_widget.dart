import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../view_model/add_vm.dart';

class CreateExpenseWidget extends ConsumerStatefulWidget {
  const CreateExpenseWidget({
    required this.addVM,
    required this.onTap,
    required this.categoryId,
    required this.categoryName,
    super.key,
  });

  final AddVM addVM;
  final VoidCallback onTap;
  final int categoryId;
  final String categoryName;

  @override
  _CreateExpenseWidgetState createState() => _CreateExpenseWidgetState();
}

class _CreateExpenseWidgetState extends ConsumerState<CreateExpenseWidget> {
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  // Function to determine if the category is income or expense
  int determineCategoryType(String categoryName) {
    if (categoryName.endsWith('1')) {
      return 1; // Income
    } else if (categoryName.endsWith('2')) {
      return 2; // Expense
    }
    return 0; // Unknown type, handle accordingly if needed
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      width: double.infinity,
      child: Column(
        children: [
          const Text("Add Expense"),
          const Divider(),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(hintText: "Enter the amount of expense"),
            keyboardType: TextInputType.number,
          ),
          const Spacer(),
          MaterialButton(
            minWidth: double.infinity,
            height: 50.h,
            color: Colors.amberAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            onPressed: () async {
              final String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
              final double amount = double.tryParse(amountController.text) ?? 0.0;

              if (amount > 0) {
                int type = determineCategoryType(widget.categoryName);

                await widget.addVM.addExpense(
                  date: date,
                  amount: amount,
                  type: type,
                  categoryId: widget.categoryId,
                );

                amountController.clear();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Expense added successfully!')),
                );
              } else {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a valid amount!')),
                );
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
