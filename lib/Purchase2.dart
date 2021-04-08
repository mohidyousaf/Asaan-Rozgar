import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'DataBase.dart';

void main() => runApp(MaterialApp(home: AddItem()));

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int balance = 990;
  bool toGive = false;
  String name = "Alina Anjum";
  int invoiceNo = 8;
  TextEditingController ProductName = new TextEditingController();
  TextEditingController PartnerName = new TextEditingController();
  TextEditingController CategoryTag = new TextEditingController();
  TextEditingController PurchasePrice = new TextEditingController();
  TextEditingController SalePrice = new TextEditingController();
  TextEditingController TaxRate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Payment Details",
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
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Balance",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Color.fromRGBO(107, 143, 165, 1.0),
                        )),
                    Text("Rs. $balance",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w800,
                          fontSize: 28.0,
                          color: Colors.white,
                        )),
                    Row(
                      children: [
                        SizedBox(width: 45),
                        Column(
                          children: [
                            Container(
                              child: (toGive == true)
                                  ? Text("You'll Give",
                                      style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(245, 70, 93, 1.0),
                                      ))
                                  : Text("You'll Get",
                                      style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12.0,
                                        color:
                                            Color.fromRGBO(46, 189, 133, 1.0),
                                      )),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height * .6531,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  )),
              child: Column(children: [
                SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text("Invoice No:  ",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Color.fromRGBO(107, 143, 165, 0.7),
                        )),
                    Text("$invoiceNo",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                    Text("Date: ",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Color.fromRGBO(107, 143, 165, 0.7),
                        )),
                    Text("16/11/2000 @",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                        )),
                  ],
                ),
                 FlatButton(
                   onPressed: () {},
                   height: 30,
                   minWidth: 200,
                   child: Text('ADD ITEMS(OPTIONAL)',
                   style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                        )),
                   color: Color.fromRGBO(136, 182, 211, 0.67)
                 ),
                 Text("Total"),
                 TextField(),
                 TextField(),
                 Text("Payment Type"),
                 Text("Cash v"),
                 Row(
                   children: [
                     Column(
                       children: [
                         Text("Balance Due"),
                         Text("Rs.0.00"),
                       ],
                     ),
                     SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                     FlatButton(
                   onPressed: () {},
                   child: Text('SAVE',
                   style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                        )),
                   color: Color.fromRGBO(136, 182, 211, 0.67)
                 ),
                   ]
                  ),

              ]),
            )),
          ],
        ));
  }
}

// Widget input_text_fields(String label, TextEditingController name) {
//   return TextField(
//       controller: name,
//       cursorColor: Colors.lightBlue,
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         enabledBorder: InputBorder.none,
//         errorBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         hintText: '$label',
//         hintStyle: GoogleFonts.lato(
//             textStyle: TextStyle(
//           color: Color.fromRGBO(60, 60, 67, 0.3),
//           fontSize: 14,
//         )),
//       ));
// }
