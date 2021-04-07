import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'DataBase.dart';

void main() => runApp(MaterialApp(home: AddItem()));

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  
  List <String> names = [
    "Shiffa Ur Rehman",
    "Mohid Yousaf",
    "Fida Hussain",
    "Roshan Aziz",
    "Adil Aslam"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .08,
          leading: IconButton(
            onPressed: () => {},
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
                      children: names.map((name) {
                      return 
                        Column(
                          children: [
                            Container(
                                child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 5),
                                                Text(name),
                                                SizedBox(height: 5),
                                                Container(
                                                  height: 2,
                                                  width: MediaQuery.of(context).size.width * 0.8,
                                                  color: Color.fromRGBO( 230, 231, 231, 1.0),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ), 
                                 ),
                          ],
                        );
                    }).toList(),
                        
                        // Container(
                        //   height: 40.0,
                        //   width: 200.0,
                        //   child: Material(
                        //     borderRadius: BorderRadius.circular(20.0),
                        //     shadowColor: Colors.grey[900],
                        //     color: Color.fromRGBO(255, 159, 10, 1.0),
                        //     elevation: 7.0,
                        //     child: GestureDetector(
                        //       onTap: () async {
                        //       // var temp = await DBprovider.db.addItem(ProductName.text.toString(), PartnerName.text.toString(), CategoryTag.text.toString(), PurchasePrice.text.toString(),SalePrice.text.toString(),TaxRate.text.toString(),val1,val2);
                        //       },
                        //       child: Center(
                        //         child: Text(
                        //           'Proceed',
                        //           style: TextStyle(
                        //           fontFamily: "Lato",
                        //           fontSize: 16.0,
                        //           color: Colors.white,
                        //         ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                    ),
                ],
              ),
              ),
          ],
        ) );
  }
}

