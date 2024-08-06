// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../data/entity/expense_model.dart';
// import '../../view_model/home_vm.dart';
//
// class EditTransactionPage extends StatefulWidget {
//   final Transaction transaction;
//
//   const EditTransactionPage({super.key, required this.transaction});
//
//   @override
//   _EditTransactionPageState createState() => _EditTransactionPageState();
// }
//
// class _EditTransactionPageState extends State<EditTransactionPage> {
//   final _formKey = GlobalKey<FormState>();
//   late String _amount;
//
//   @override
//   void initState() {
//     super.initState();
//     _amount = widget.transaction.amount;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Transaction')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Date: ${widget.transaction.date.toLocal().toString().split(' ')[0]}',
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 initialValue: _amount,
//                 decoration: const InputDecoration(labelText: 'Amount'),
//                 onSaved: (value) => _amount = value!,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an amount';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               Consumer(
//                 builder: (context, ref, child) {
//                   final homeVM = ref.watch(homeVMProvider);
//                   return ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();
//                         final editedTransaction = Transaction(
//                           id: widget.transaction.id,
//                           date: widget.transaction.date,
//                           amount: _amount,
//                           type: widget.transaction.type,
//                           categoryId: widget.transaction.categoryId,
//                         );
//                         homeVM.editTransaction(editedTransaction);
//                         Navigator.of(context).pop();
//                       }
//                     },
//                     child: const Text('Save Changes'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
