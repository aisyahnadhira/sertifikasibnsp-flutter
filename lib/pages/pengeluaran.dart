// import 'package:flutter/material.dart';
// import 'package:flutter_application_5/Model/item.dart';
// import 'package:intl/intl.dart';

// class Pengeluaran extends StatefulWidget {
//   final Item? item;

//   Pengeluaran(this.item);

//   @override
//   PengeluaranState createState() => PengeluaranState(this.item);
// } //class controller

// class PengeluaranState extends State<Pengeluaran> {
//   Item? item;
//   PengeluaranState(this.item);
//   final TextEditingController _dateController = TextEditingController();
//   TextEditingController keteranganController = TextEditingController();
//   TextEditingController nominalController = TextEditingController();
//   String type = 'Pengeluaran';

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null && picked != DateTime.now()) {
//       final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
//       _dateController.text = formattedDate;
//     }
//   }

//   void _resetForm() {
//     _dateController.text =
//         DateFormat('yyyy-MM-dd').format(DateTime(2021, 1, 1));
//     keteranganController.clear();
//     nominalController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //kondisi
//     if (item != null) {
//       keteranganController.text = item!.keterangan;
//       nominalController.text = item!.nominal.toString();
//     }
//     //rubah
//     return Scaffold(
//         body: Padding(
//       padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
//       child: ListView(
//         children: <Widget>[
//           // nama
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 16.0),
//                   child: Text("Tambah Pengeluaran",
//                       style: TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 20)),
//                 ),
//                 Text(
//                   "Tanggal:",
//                   style: TextStyle(fontWeight: FontWeight.w800),
//                 ),
//                 TextField(
//                   controller: _dateController,
//                   decoration: InputDecoration(
//                     hintText: "Pilih Tanggal",
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.calendar_today),
//                       onPressed: () {
//                         _selectDate(context);
//                       },
//                     ),
//                   ),
//                   onTap: () {
//                     _selectDate(context);
//                   },
//                 ),
//                 // KETERANGAN
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Keterangan:",
//                         style: TextStyle(fontWeight: FontWeight.w800),
//                       ),
//                       TextField(
//                         controller: nominalController,
//                         keyboardType: TextInputType.text,
//                         onChanged: (value) {
//                           //
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 // NOMINAL
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Nominal:",
//                         style: TextStyle(fontWeight: FontWeight.w800),
//                       ),
//                       TextField(
//                         controller: keteranganController,
//                         keyboardType: TextInputType.number,
//                         onChanged: (value) {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 // tombol button
//                 Column(
//                   children: <Widget>[
//                     TextButton(
//                       onPressed: _resetForm,
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         padding: const EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                             color: Colors.orange,
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                             border: Border.all(color: Colors.black, width: 2)),
//                         child: Text(
//                           'Reset',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.black, fontWeight: FontWeight.w900),
//                         ),
//                       ),
//                     ),
//                     // tombol simpan
//                     TextButton(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         padding: const EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 175, 253, 215),
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                             border: Border.all(color: Colors.black, width: 2)),
//                         child: Text(
//                           'Simpan',
//                           textScaleFactor: 1,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.black, fontWeight: FontWeight.w900),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (item == null) {
//                           // tambah data
//                           item = Item(
//                             keteranganController.text,
//                             int.parse(nominalController.text),
//                             type:
//                                 'Pengeluaran', // Set type to 'Pengeluaran' for income
//                           );
//                         } else {
//                           // ubah data
//                           item?.keterangan = keteranganController.text;
//                           item?.nominal = int.parse(nominalController.text);
//                           item?.type =
//                               'Pengeluaran'; // Update type to 'Pengeluaran' for income
//                         }
//                         // kembali ke layar sebelumnya dengan membawa objek item
//                         Navigator.pop(context, item);
//                       },
//                     ),
//                     // tombol batal
//                     TextButton(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         padding: const EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                             border: Border.all(color: Colors.black, width: 2)),
//                         child: Text(
//                           '<< Kembali',
//                           textScaleFactor: 1,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.w900),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
