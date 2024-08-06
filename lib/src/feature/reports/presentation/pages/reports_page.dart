import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  void _exportToExcel() {
    final excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet()!];

    // Example of setting cell values
    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3)).value = const TextCellValue('Text string');
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 4)).value =
        const TextCellValue('Text string Text string Text string Text string Text string Text string Text string Text string');

    // Save the file
    excel.save(fileName: "report.xlsx");

    // Provide feedback to the user (you can add more sophisticated feedback mechanisms)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Exported to Excel successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export to Excel'),
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
