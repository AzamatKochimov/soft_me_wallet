import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/statistics_vm.dart';
import '../widget/pie_chart_widget.dart';
class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPage = ref.watch(selectedPageProvider);

    final statistics = ref.watch(statisticsVM);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: DropdownButton<String>(
          iconSize: 28,
          iconEnabledColor: Colors.black,
          underline: const SizedBox.shrink(),
          value: selectedPage,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          elevation: 0,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              ref.read(selectedPageProvider.notifier).state = newValue;
            }
          },
          items: <String>['Expenses', 'Income']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(50.0),
        //   child: Container(
        //     height: 40.h,
        //     width: double.infinity,
        //     margin: EdgeInsets.only(left: 30.w, bottom: 20.h, right: 30.w),
        //     child: StatisticsTabBar(
        //       onTabTapped: (index) {
        //         StateVM.changeTab(index);
        //       },
        //       selectedIndex: selectedIndex,
        //     ),
        //   ),
        // ),
      
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 400.h,
        child: PieChartPage(statistics: statistics),
      ),
    );
  }
}
