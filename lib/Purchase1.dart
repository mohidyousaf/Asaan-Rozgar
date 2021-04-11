import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/PartyNames.dart';
import 'package:provider/provider.dart';
import 'DataBase.dart';


class Purchase extends StatefulWidget {
  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  List <String> names = [];

  getParty() async{
    var temp2 = await DBprovider.db.getParties();
    setState((){
      names = temp2;
    });
  }

  @override
  void initState(){
    super.initState();
    print("hi");
    getParty();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .08,
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context)
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Choose Party",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
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
        body:Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.33,
                  color: Color.fromRGBO(52, 199, 89, 1.0),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Column(
                      children: names.map((name) => PartyNAme(
                          name:name,
                          pass: (){
                            Navigator.pushNamed(context, '/purchase2', arguments: {
                              'name': name,
                            } );
                          }

                      )).toList(),
                    ),
                ],
              ),
              ),
          ],
        ) );
  }
}

