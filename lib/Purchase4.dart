import 'dart:ffi';

import 'package:asaanrozgar/Add_Item.dart';
import 'package:flutter/material.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';

class Purchase4 extends StatefulWidget {
  @override
  _Purchase4State createState() => _Purchase4State();
}

class _Purchase4State extends State<Purchase4> {

  List<itemList> objects=[
  itemList(itemName:'Lays', image:'Image1'),
  itemList(itemName:'Cheetos', image:'Image2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Choose Item",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width * 0.55,
                      color: Color.fromRGBO(52, 199, 89, 1.0),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Column(
                        children:
                            objects.map((sub) => cart(
                              obj1 : sub
                            )
                    ).toList()
                    ),
                  ],
                ),
              ],
            ),
    ));
  }
}