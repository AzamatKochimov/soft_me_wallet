import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/entity/expense_model.dart';
import '../../view_model/home_vm.dart';
import '../widgets/home_app_bar_bottom_widget.dart';
import '../widgets/transaction_item_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVM = ref.watch(homeVMProvider);

    if (!homeVM.isLoggedIn) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text("Soft Me Wallet", style: TextStyle(fontWeight: FontWeight.w500)),
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month_outlined),
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(60.0), // Adjust height as needed
            child: HomeAppBarBottomWidget(),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Text(
              "No transactions yet! please log in or register to view or add transactions",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    if (homeVM.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (homeVM.error != null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            homeVM.error!,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final groupedTransactions = <DateTime, List<Transaction>>{};
    for (var transaction in homeVM.transactions) {
      if (transaction.date != null) {
        final date = DateTime(transaction.date.year, transaction.date.month, transaction.date.day);
        if (!groupedTransactions.containsKey(date)) {
          groupedTransactions[date] = [];
        }
        groupedTransactions[date]!.add(transaction);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Soft Me Wallet", style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust height as needed
          child: HomeAppBarBottomWidget(),
        ),
      ),
      body: ListView(
        children: groupedTransactions.entries.map((entry) {
          final date = entry.key;
          final transactions = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              ...transactions.map((transaction) => TransactionItemWidget(transaction: transaction)).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
