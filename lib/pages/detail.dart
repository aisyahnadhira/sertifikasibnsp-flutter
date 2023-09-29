import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_5/dbhelper.dart';
import 'package:flutter_application_5/pages/entryform.dart';
import 'package:flutter_application_5/Model/item.dart';

class Detail extends StatefulWidget {
  @override
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text("Detail Cash Flow",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          ),
          Expanded(
            child: createListView(),
          ),
          TextButton(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.black, width: 2)),
              child: Text(
                '<< Kembali',
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }

  ListView createListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            isThreeLine: true,
            title: Text(
              this.itemList![index].name,
              style: textStyle,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price : " + this.itemList![index].price.toString()),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        );
      },
    );
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

  Future<Item?> navigateToEntryForm(BuildContext context, Item? item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    }));
    return result;
  }
}
