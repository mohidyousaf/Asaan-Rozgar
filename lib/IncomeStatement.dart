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

// void main() => runApp(MaterialApp(home: Reports1()));

class Reports1 extends StatefulWidget {
  @override
  _Reports1State createState() => _Reports1State();
}

class _Reports1State extends State<Reports1> {
  Map<String, double> dataMap = {
    'BILLS':1,
    'SALARY': 1,
    'RENT': 1,
  };

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
          title: Text("Income Statement",
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
        floatingActionButton:
        std_FAB(Colors.white, 11, 71, 109, buttons, context),
        bottomNavigationBar: std_chinbar(context, 0,0,0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
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
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:18.0),
                                      child: percChart(0.3, Color.fromRGBO(11, 71, 109, 1), "30%","Opex Ratio"),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:18.0),
                                      child: percChart(0.84, Color.fromRGBO(24, 153, 161, 1), "84%","Gross Profit Margin"),
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
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.15,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.045,
                                          ),
                                          Text("Income",
                                              style: TextStyle(
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              )),
                                          Text("384",
                                              style: TextStyle(
                                                color: Color.fromRGBO(11, 71, 109, 1.0),
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              )),
                                          Divider(),
                                          Text("Expense",
                                              style: TextStyle(
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              )),
                                          Text("60",
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 0, 0, 1.0),
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              )),
                                          Divider(),
                                          Text("Net Profit",
                                              style: TextStyle(
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              )),
                                          Text("324",
                                              style: TextStyle(
                                                color: Color.fromRGBO(23, 225, 67, 1.0),
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              )),
                                        ],
                                      ),
                                    ), //here
                                    LineGraph(),
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
              
            height: MediaQuery.of(context).size.height * 0.5495,
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
               margin: EdgeInsets.only(top: 20),

               child: Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(

                    children: [
                      Center(
                        child: Text("Income Statement",
                                style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                   )
                     ),
                      ),
                      SizedBox(height: 25),
                      Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                     Text("Revenue",
                     style: TextStyle(
                                color: Color.fromRGBO(11, 71, 109, 1),
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                 )
                     ),
                     Spacer(),
                     Text("Rs.",
                     style: TextStyle(
                                color: Color.fromRGBO(11, 71, 109, 1),
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                 )
                     ),
                     ]
                     ),
                    ],
                   ),
                  SizedBox(height: 15),
                   Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                     Text("1.",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                     ),
                     SizedBox(width: 5),
                     Text("Mobile Sale",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                                 ),
                     Spacer(),
                     Text("51,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                     ),
                   ],
                   ),
                   SizedBox(height: 8),

                   Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                     Text("1.",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                     ),
                     SizedBox(width: 5),
                     Text("10 ruppay dy Turturay",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                                 ),
                     Spacer(),
                     Text("510",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                     ),
                   ],
                   ),
                   SizedBox(height: 8),

                   Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                     Text("1.",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                     ),
                     SizedBox(width: 5),
                     Text("Mobile Sale with something",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                                 ),
                     Spacer(),
                     Text("51,000,000",
                     style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                 )
                     ),
                   ],
                   ),
                   SizedBox(height: 8),
                   
                 ],
               ),
             ),
           )
            )// further items here
          ],
        ),
        );
  }
}
