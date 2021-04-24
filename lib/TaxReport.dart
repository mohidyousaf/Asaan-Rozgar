// Cashflow Statement
// 
import 'dart:ffi';
import 'package:asaanrozgar/home.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/PartyNames.dart';
import 'package:provider/provider.dart';
import 'DataBase.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:asaanrozgar/Widgets/linegraph.dart';
import 'Widgets/pieChart.dart';
import 'Widgets/percChart.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';


// void main() => runApp(MaterialApp(home: TaxReport()));

class TaxReport extends StatefulWidget {
  @override
  _TaxReportState createState() => _TaxReportState();
}

class _TaxReportState extends State<TaxReport> {
  
 List<report_items> objects = [
    report_items(itemName: 'Mobile sale', price: 51000),
    report_items(itemName: 'Bag Sale', price: 5000),
    report_items(itemName: 'Camera Sale', price: 150000),
    report_items(itemName: 'Merchandise Sale', price: 50000),
  ];
  List<Color> colorsList = [
    Color.fromRGBO(136, 182, 211, 1),
    Color.fromRGBO(38, 51, 58, 1),
    Color.fromRGBO(11,71,109, 1),  
    ];

  @override
  Widget build(BuildContext context) {
    final List<ChildButton> buttons = [ChildButton(label: 'sale', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/sale'),
                                      ChildButton(label: 'purchase', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/purchase')];

    return Scaffold(
        backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .08,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Tax Report",
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
        //floatingActionButton:
        //std_FAB(Colors.white, 11, 71, 109, buttons, context),
       // bottomNavigationBar: std_chinbar(context, 0,0,0),
       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: Column(
          children: [
        
            Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          // margin: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
          ),
           child: 
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child:
             Container(
               margin: EdgeInsets.only(top: 10),

               child: SingleChildScrollView(
                                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(

                      children: [
                         
                        //SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("To: ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                              color: Color.fromRGBO(107, 143, 165, 0.7),
                            )),
                            Text("16/11/2000",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                )),
                                SizedBox(width: 3,),
                                Icon(Icons.calendar_today_rounded,
                                color: Color.fromRGBO(11, 71, 109, 1.0),
                                size: 15,),
                            Spacer(),
                            Text("From: ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                              color: Color.fromRGBO(107, 143, 165, 0.7),
                            )),
                            Text("16/11/2000",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                )),
                                SizedBox(width: 3,),
                                Icon(Icons.calendar_today_rounded,
                                color: Color.fromRGBO(11, 71, 109, 1.0),
                                size: 15,),
                                SizedBox(width: 10,)
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children:[
                         
                       Text("TYPE",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(flex: 3,),
                       Text("AMOUNT",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(),
                       Text("BASE",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                   )
                       ),
                       ]
                       ),
                       Divider(),
                      //  Column(
                      //     children:[
                            
                      //       ]
                     
                      //  ),

            // Tax Paid                 
                  SizedBox(height: 8), 
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     Text("TAX PAID",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                // textBaseline: TextBaseline.values,
                                 )
                                 ),
                     
                   ],
                   ),
                  SizedBox(height: 8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     Text("15% Tax",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(flex: 3),
                     Text("6,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(),
                     Text("40,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                   ],
                   ),
                  
                  SizedBox(height: 8),
                   Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     Text("GST",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(flex: 3),
                     Text("3,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(),
                     Text("18,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                   ],
                   ),
                  
                  SizedBox(height: 8),
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                       Text("Total Tax Paid",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(flex:3),
                       Text("9,000",
                       style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(),
                       Text("58,000",
                       style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                   )
                       ),
                       ]
                       ),
                      ],
                     ),
                // Tax Recieved
                SizedBox(height: 8),
                    SizedBox(height: 8), 
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     Text("TAX RECIEVED",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                // textBaseline: TextBaseline.values,
                                 )
                                 ),
                     
                   ],
                   ),
                  SizedBox(height: 8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     Text("15% Tax",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(flex: 3),
                     Text("10,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(),
                     Text("40,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                   ],
                   ),
                  
                  SizedBox(height: 8),
                   Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     Text("GST",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(flex: 3),
                     Text("3,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                     Spacer(),
                     Text("18,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                   ],
                   ),
                  
                  SizedBox(height: 8),
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                       Text("Total Tax Recieved",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(flex:3),
                       Text("10,000",
                       style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(),
                       Text("30,000",
                       style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                   )
                       ),
                       ]
                       ),
                      SizedBox(height: 28),
                      
                     
                       Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children:[
                         
                       Text("TOTAL BALANCE",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                   )
                       ),
                      Spacer(flex:3),
                       Text("-9,000",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(),
                       Text("-33,000",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                   )
                       ),
                       ]
                       ),
                      SizedBox(height: 16),
                       FlatButton(
                          onPressed: () {},
                          height: 30,
                          minWidth: 90,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text('PRINT',
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10.0,
                                  color: Colors.white
                              )),
                          color: Color.fromRGBO(11, 71, 109, 1.0)),
                       //here
                   ],
                 ),
               ),
             ),
           )
            ),// further items here
          ],
        ),
        ),
        );
  }
}
