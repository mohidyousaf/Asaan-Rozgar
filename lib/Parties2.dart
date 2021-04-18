import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Widgets/std_appbar.dart';
import 'Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'DataBase.dart';

// void main() => runApp(MaterialApp(home: PaymentDetail()));

class PaymentDetail extends StatefulWidget {
  
  @override
  _PaymentDetailState createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
List<ChildButton> buttons = [ChildButton(label: 'Add Party', icon: Icon(Icons.person, color: Colors.white,), route: '/addParty')];
  int balance = 990;
  bool toGive = false;
  String name = "Alina Anjum";
  int invoiceNo = 8;
  // TextEditingController ProductName = new TextEditingController();
  // TextEditingController PartnerName = new TextEditingController();
  // TextEditingController CategoryTag = new TextEditingController();
  // TextEditingController PurchasePrice = new TextEditingController();
  // TextEditingController SalePrice = new TextEditingController();
  // TextEditingController TaxRate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Order No. 234",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),

        floatingActionButton:
        std_FAB(Colors.white, 109, 11, 93, buttons, context),
        bottomNavigationBar: std_chinbar(context, 0,0,0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

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
                  color: Colors.white,
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
                    Text("16/11/2000",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                        )),
                  ],
                ),
                  // SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                    decoration: InputDecoration(
                        labelText: "Name",
                        prefixText: "Rs.",
                    )
                ),
                  ),
                  // SizedBox(height:10),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: TextField(
                    decoration: InputDecoration(
                        labelText: "Recieved",
                        prefixText: "Rs.",
                    )
                ),
                 ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new DropdownButton<String>(
                          hint: Text("Payment Method"),
                          items: <String>['Cash', 'Bank'].map((String value) {
                          return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                                );
                                }).toList(),
                                onChanged: (_) {},
                                ),
                      ],
                    ),
                  ),
                ),
               
                // Last Button And columns
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[ 
                     Column(
                       children: [
                         Text("Balance Due",
                         style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                              )
                         ),
                         SizedBox(height:8),
                         Text("Rs.0.00",
                         style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                              )
                         ),
                       ],
                    ),
                    FlatButton(
                    onPressed: () {

                    },
                    height: 40,
                    minWidth: 90,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('NEXT',
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 13.0,
                            color: Colors.white
                        )),
                    color: Color.fromRGBO(11, 71, 109, 1.0))
                   ]
                  ),
                )
              ]
              ),
            )
            ),
          ],
        )
        );
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