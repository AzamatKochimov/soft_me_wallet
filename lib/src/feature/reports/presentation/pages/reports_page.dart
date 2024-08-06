import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  void _exportToExcel() {
    final excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet()!];

    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3)).value = const TextCellValue('Text string');
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 4)).value =
        const TextCellValue('Text string Text string Text string Text string Text string Text string Text string Text string');

    excel.save(fileName: "report.xlsx");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Exported to Excel successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Export to Excel'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _exportToExcel,
          child: const Text('Export'),
        ),
      ),
    );
  }
}
