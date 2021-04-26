import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/PartyNames.dart';
import 'package:provider/provider.dart';
import 'DataBase.dart';


class AddItemParty extends StatefulWidget {
  @override
  _AddItemPartyState createState() => _AddItemPartyState();
}

class _AddItemPartyState extends State<AddItemParty> {
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
        backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
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
          elevation: 0,
          backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 1.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top:40.0),
            child: SingleChildScrollView(
              child: Column(
                    children: names.map((name) => PartyNAme(
                        name:name,
                        pass: (){
                          Navigator.pushNamed(context, '/addItem', arguments: {
                            'name': name,
                          } );
                        }

                    )).toList(),
                  ),
            ),
          ),
        )
    );
  }
}

