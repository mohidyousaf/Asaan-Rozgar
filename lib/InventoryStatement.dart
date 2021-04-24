import 'dart:ffi';
import 'package:asaanrozgar/home.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/PartyNames.dart';
import 'package:provider/provider.dart';
import 'DataBase.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:asaanrozgar/Widgets/linegraph.dart';
import 'Widgets/pieChart.dart';
import './Widgets/percChart.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';


// void main() => runApp(MaterialApp(home: InventoryReport()));

class InventoryReport extends StatefulWidget {
  @override
  _InventoryReportState createState() => _InventoryReportState();
}

class _InventoryReportState extends State<InventoryReport> {
  Map<String, double> dataMap = {
    'SNACKS':1,
    'TOILETERIES': 1,
    'SHOES': 1,
  };
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
          title: Text("Inventory Statement",
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
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                     decoration: BoxDecoration(
                     color: Color.fromRGBO(11, 71, 109, 1.0),
                  ),
                    child: Wrap(
                      children: [
                        Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromRGBO(250, 250, 250, 1),
                                ),
                                child: 
                                Container(
                                  margin:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.12),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "TURNOVER RATIO",
                                            style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15.0,
                                              
                                              
                                            ),
                                            ),

                                            Text(
                                            "9",
                                              style: TextStyle(
                                              color: Color.fromRGBO(11, 71, 109, 1),
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.normal,
                                              fontSize: 40.0,
                                              
                                              )  
                                            ),
                                        ],

                                      ),
                                    Divider(),
                                    SizedBox(width:20),
                                     Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "TURNOVER DAYS",
                                            style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15.0,
                                              
                                              
                                            ),
                                            ),

                                            Text(
                                            "40.6",
                                              style: TextStyle(
                                              color: Color.fromRGBO(11, 71, 109, 1),
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.normal,
                                              fontSize: 40.0,
                                              
                                              )  
                                            ),
                                        ],

                                      ),
                                    
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                            ],
                      ),
                      ]),
                  ),
                  
                  Container(
                     decoration: BoxDecoration(
                     color: Color.fromRGBO(11, 71, 109, 1.0),
                  ),
                    child: Wrap(
                      children: [
                        Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromRGBO(250, 250, 250, 1),
                                ),
                                child: Row(
                                  children: [
                                //It creates Overflow, Please Check Here...
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left:8.0),
                                    //   child: Text(
                                    //     "Assets\nBreakdown",
                                    //     style: TextStyle(
                                    //               color: Color.fromRGBO(11,71,109, 1.0),
                                    //               fontFamily: "Lato",
                                    //               fontWeight: FontWeight.w800,
                                    //               fontSize: 22.0,
                                    //             )
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:30.0),
                                      child: pieChartOne(context, dataMap, colorsList),
                                    ),
                    
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                            ],
                      ),
                      ]),
                  ),
                ],
              ),
            ),
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
                         Text("Inventory Report",
                                  style: TextStyle(
                                    color: Color.fromRGBO(11, 71, 109, 1),
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                     )
                       ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
          //ASSETS
                      Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children:[
                         
                       Text("Item Name",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                   )
                       ),
                      Spacer(),
                       Text("Profit/Loss",
                       style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                   )
                       ),
                       Spacer(),
                       Text("Sales",
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


                  
                 
                  
            // Container is Each Category of the Inventory
                Container(  
                  child: Column(
                    children: [
                        Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: Text("Bags",
                           style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                   )
                         ),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     
                     Text("Camel Travel Bag",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                      Spacer(),
                     Text("1200",
                     style: TextStyle(
                       
                                color: Color.fromRGBO(46, 189, 133, 1),
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                     Spacer(),
                     Text("+16%",
                     style: TextStyle(
                                color:Color.fromRGBO(46, 189, 133, 1),
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                   ],
                   ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                 Container(  
                  child: Column(
                    children: [
                        Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: Text("Shoes",
                           style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                   )
                         ),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                    
                     SizedBox(width: 5),
                     
                     Text("Nike Shoes",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                                 ),
                      Spacer(),
                     Text("1500",
                     style: TextStyle(
                     
                                color: Color.fromRGBO(245, 70, 93, 1),
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                     Spacer(),
                     Text("-0.8%",
                     style: TextStyle(
                                color:Color.fromRGBO(245, 70, 93, 1),
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                 )
                     ),
                   ],
                   ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                 
                
          //Total: Needed to be change here
            // Row(
            //           // mainAxisAlignment: MainAxisAlignment.spaceAround,
            //            children:[
                         
            //            Text("TOTAL LIABILITIES AND EQUITY",
            //            style: TextStyle(
            //                       color: Color.fromRGBO(11, 71, 109, 1),
            //                       fontFamily: "Lato",
            //                       fontWeight: FontWeight.w700,
            //                       fontSize: 16,
            //                        )
            //            ),
            //            Spacer(),
            //            Text("28000",
            //            style: TextStyle(
            //                       color: Color.fromRGBO(11, 71, 109, 1),
            //                       fontFamily: "Lato",
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 16,
            //                        )
            //            ),
            //            ]
            //            ),
                     
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

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
                   ]),
             ),
           )
            ),// further items here
            )],
        ),
        ),
        );
  }
}
