import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Widgets/std_appbar.dart';
import 'Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'DataBase.dart';

void main() => runApp(MaterialApp(home: add_expenses2()));



class add_expenses2 extends StatefulWidget {
  
  @override
  _add_expenses2State createState() => _add_expenses2State();
}

class _add_expenses2State extends State<add_expenses2> {
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
    int color_Red = 12;
    int color_Green = 109;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double longBtt_width = phone_width * 0.487;
    double longBtt_height = phone_height* 0.051;
    double image_height=  phone_height * 0.052;
    double image_width = phone_width *0.149;
    double textfield_gap = phone_height *0.0125;
    double button_gap = phone_height *0.063;
    double divider_width = phone_width * 0.8;
    double slider_width=phone_width*0.834;
    double slider_height=phone_height*0.0417;
    double image_container_width=phone_width*0.219;
    double image_container_height=phone_height*0.113;
    return Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
        appBar: std_appbar(context, 'Expense Details', color_Red, color_Green, color_Blue),
        // appBar: AppBar(
        //   toolbarHeight: MediaQuery.of(context).size.height * .1,
        //   leading: IconButton(
        //     onPressed: () => {},
        //     icon: Icon(Icons.arrow_back_ios),
        //   ),
        //   title: Text("Order No. 234",
        //       style: TextStyle(
        //         fontFamily: "Lato",
        //         fontWeight: FontWeight.bold,
        //         fontSize: 24.0,
        //       )),
        //   centerTitle: true,
        //   backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
        //   actions: <Widget>[
        //     IconButton(
        //       onPressed: () => {},
        //       icon: Icon(Icons.menu),
        //     )
        //   ],
        // ),

        floatingActionButton:
        std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
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
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
           // SingleChildScrollView(
                 Expanded(
                                  child: Container(
              //height: MediaQuery.of(context).size.height * .6531,
              //height: 493,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    )),
              child: SingleChildScrollView(
                              child: Column(children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        //SizedBox(width: 20),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.7),
                        Container(
                          child: Row(children: [
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
                          ],)
                        )
                      ],
                    ),
                       SizedBox(height:MediaQuery.of(context).size.height * 0.071),
                       Row(
                         children: [
                           Container(
                                alignment: AlignmentDirectional.topStart,
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Type: ',
                                  style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 16) 
                                ),
                              ),
                              SizedBox(width:5.0,height:40.0),
                              Container(
                            width: phone_width*0.776,
                            child: TextField(
                              decoration: InputDecoration(

                              )
                            ),
                          ),
                         ],
                       ),
                          
                          SizedBox(height: 30.0),
                       Container(
                            
                            alignment: AlignmentDirectional.topStart,
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Total: ',
                              style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 16) 
                            ),
                          ),
                      // SizedBox(height:10),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 16.0),
                           child: Text(
                             'Rs.',
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 16)
                           ),
                         ),
                         SizedBox(width: 25.0),
                         Container(
                           width: phone_width*0.773,
                           child: TextField(

                           )
                         )
                     ],),
                    SizedBox(height: 40.0,),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 70),
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
              ),
            ),
                )
           // ),
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