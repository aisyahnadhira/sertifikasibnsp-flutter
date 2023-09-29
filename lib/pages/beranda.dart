import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/detail.dart';
import 'package:flutter_application_5/pages/pengaturan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_5/dbhelper.dart';
import 'package:flutter_application_5/pages/entryform.dart';
import 'package:flutter_application_5/Model/item.dart';

class Beranda extends StatefulWidget {
  @override
  BerandaState createState() => BerandaState();
}

class BerandaState extends State<Beranda> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item>? itemList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (itemList == null) {
      itemList = <Item>[];
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24),
          child: Column(children: [
            Text(
              "Rangkuman Bulan Ini",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Text(
              "Pengeluaran: Rp. ",
              style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            Text("Pemasukan: Rp. ",
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w600)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async {
                    var item = await navigateToEntryForm(context, null);
                    if (item != null) {
                      int result = await dbHelper.insert(item);
                      if (result > 0) {
                        updateListView();
                      }
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Image.asset(
                          "assets/images/pemasukan.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Text(
                          "Tambah Pemasukan",
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var item = await navigateToEntryForm(context, null);
                    if (item != null) {
                      int result = await dbHelper.insert(item);
                      if (result > 0) {
                        updateListView();
                      }
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Image.asset(
                          "assets/images/pengeluaran.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Text(
                          "Tambah Pengeluaran",
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Detail()));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Image.asset(
                          "assets/images/detail.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Text(
                          "Detail cash Flow",
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pengaturan()));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Image.asset(
                          "assets/images/setting.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Text(
                          "Pengaturan",
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<Item?> navigateToEntryForm(BuildContext context, Item? item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    }));
    return result;
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
