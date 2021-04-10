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

  itemList tm;
  List<itemList> objects=[];
  Map data ={};
  String name;
  List<Map<String, dynamic>> temp1;

  getItemList()async{
    List<Map<String, dynamic>> temp2 = await DBprovider.db.getItemList(name);
    setState(() {
      temp1= temp2;
      print(temp1);
      temp1.forEach((element) {
        objects.add(itemList(itemName:element['ProductName'], image:'Image'));
      });
    });
  }


  @override
  void initState() {
    super.initState();
    print("init");
    // future that allows us to access context. function is called inside the future
    // otherwise it would be skipped and args would return null
    Future.delayed(Duration.zero, () {
      getItemList();
    });
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    setState(() {
      name = data['name'];
      // tm = data['obj'];

    });
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
                              obj1 : sub,
                                pass: (){
                                  Navigator.pushNamed(context, '/purchase3', arguments: {
                                    'obj': sub,
                                  } );
                                }

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