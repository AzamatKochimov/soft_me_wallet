import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../view_model/statistics_vm.dart';

class PieChartPage extends StatelessWidget {
  final StatisticsVm statistics;

  const PieChartPage({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    // Construct dataMap from statistics
    Map<String, double> dataMap = {
      "Food": 5,
      "Car Loan": 3,
      "Flowers": 2,
      "Shopping": 2,
      "Car Fuel": 2,
    };

    List<Color> colorList = [
      Colors.redAccent,
      Colors.yellowAccent,
      Colors.greenAccent,
      Colors.lightBlueAccent,
      Colors.orangeAccent
    ];

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: 400.h,
        child: PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 40,
          chartRadius: MediaQuery.of(context).size.width / 3.2,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 40,
          centerText: "${statistics.totalIncome - statistics.totalExpenses}",
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: true,
            decimalPlaces: 1,
          ),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        ),
      ),
    );
  }
}
