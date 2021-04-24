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

void main() => runApp(MaterialApp(home: BalanceReport()));

class BalanceReport extends StatefulWidget {
  @override
  _BalanceReportState createState() => _BalanceReportState();
}

class _BalanceReportState extends State<BalanceReport> {
  Map<String, double> dataMap = {
    'LAND': 1,
    'INVENTORY': 1,
    'EQUIPMENT': 1,
  };
  int cashEq = 3000;
  int accRcv = 1000;
  int inventory = 1000;
  int land = 8000;
  int equipment = 7000;
  int intangibleAsset = 8000;
  int totalAsset = 28000;
  int accPayable = 10000;
  int loanPayable = 8000;
  int shareholderEquity = 10000;
  int totalLiabAndEquity = 28000;


//  List<report_items> objects = [
//     report_items(itemName: 'Mobile sale', price: 51000),
//     report_items(itemName: 'Bag Sale', price: 5000),
//     report_items(itemName: 'Camera Sale', price: 150000),
//     report_items(itemName: 'Merchandise Sale', price: 50000),
//   ];
  List<Color> colorsList = [
    Color.fromRGBO(136, 182, 211, 1),
    Color.fromRGBO(38, 51, 58, 1),
    Color.fromRGBO(11, 71, 109, 1),
  ];

  @override
  Widget build(BuildContext context) {
    final List<ChildButton> buttons = [
      ChildButton(
          label: 'sale',
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          route: '/sale'),
      ChildButton(
          label: 'purchase',
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          route: '/purchase')
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Balance Sheet",
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
                    child: Wrap(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(250, 250, 250, 1),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "QUICK RATIO",
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                      Text("1.5",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                193, 193, 193, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 30.0,
                                          )),
                                      Text(
                                        "CURRENT RATIO",
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                      Text(
                                        "1.8",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(193, 193, 193, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: percChart(
                                      0.84,
                                      Color.fromRGBO(24, 153, 161, 1),
                                      "84%",
                                      "DEPT-ASSET RATIO"),
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
                    child: Wrap(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(250, 250, 250, 1),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                      ),
                                      Text("Assets",
                                          style: TextStyle(
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.0,
                                          )),
                                      Text("384",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                11, 71, 109, 1.0),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.0,
                                          )),
                                      Divider(),
                                      Text("Liabilities",
                                          style: TextStyle(
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.0,
                                          )),
                                      Text("60",
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(255, 0, 0, 1.0),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.0,
                                          )),
                                      Divider(),
                                      Text("W.C",
                                          style: TextStyle(
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.0,
                                          )),
                                      Text("324",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                23, 225, 67, 1.0),
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
                    child: Wrap(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
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
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child:
                                      pieChartOne(context, dataMap, colorsList),
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
            SingleChildScrollView(
                          child: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                        child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Balance Sheet",
                                    style: TextStyle(
                                      color: Color.fromRGBO(11, 71, 109, 1),
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                //ASSETS
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("ASSETS",
                                          style: TextStyle(
                                            color: Color.fromRGBO(11, 71, 109, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          )),
                                      Spacer(),
                                      Text("Rs.",
                                          style: TextStyle(
                                            color: Color.fromRGBO(11, 71, 109, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          )),
                                    ]),
                                Divider(),
                                //  Column(
                                //     children:[

                                //       ]

                                //  ),

                                // Current Assets
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                // Current Assets
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("CURRENT ASSETS",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                          // textBaseline: TextBaseline.values,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.013),

                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Cash and Cash Equivalents",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(cashEq.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Accounts Recievables",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(accRcv.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),

                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Inventory",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(inventory.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),

                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                //Property & Equipment
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("PROPERTY AND EQUIPMENT",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                          // textBaseline: TextBaseline.values,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.013),

                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Lands (Shops / Building)",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(land.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Equipment (Machinery)",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(equipment.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),

                                //Other Assets
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),

                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("OTHER ASSETS",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                          // textBaseline: TextBaseline.values,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),

                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Intagnible Assets (Bonds, Shares)",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(intangibleAsset.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),

                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),

                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Total Assets",
                                          style: TextStyle(
                                            color: Color.fromRGBO(11, 71, 109, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          )),
                                      Spacer(),
                                      Text(totalAsset.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          )),
                                    ]),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                //LIABILITIES
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("LIABILITIES",
                                          style: TextStyle(
                                            color: Color.fromRGBO(11, 71, 109, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          )),
                                      Spacer(),
                                      Text("Rs.",
                                          style: TextStyle(
                                            color: Color.fromRGBO(11, 71, 109, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          )),
                                    ]),
                                Divider(),
                                //  Column(
                                //     children:[

                                //       ]

                                //  ),

                                // Current Assets
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.013),
                                // Current Assets
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("CURRENT LIABILITIES",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                          // textBaseline: TextBaseline.values,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.013),

                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Account Payables",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(accPayable.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Loan Payables",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(loanPayable.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                //EQUITY
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("EQUITY",
                                          style: TextStyle(
                                            color: Color.fromRGBO(11, 71, 109, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          )),
                                      Spacer(),
                                      Text("Rs.",
                                          style: TextStyle(
                                            color: Color.fromRGBO(11, 71, 109, 1),
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          )),
                                    ]),
                                Divider(),

                                //  Column(
                                //     children:[

                                //       ]

                                //  ),

                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.013),

                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 5),
                                    Text("Shareholder's Equity",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    Spacer(),
                                    Text(shareholderEquity.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),
                            //Total
                            Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("TOTAL LIABILITIES AND EQUITY",
                                      style: TextStyle(
                                        color: Color.fromRGBO(11, 71, 109, 1),
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      )),
                                  Spacer(),
                                  Text(totalLiabAndEquity.toString(),
                                      style: TextStyle(
                                        color: Color.fromRGBO(11, 71, 109, 1),
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      )),
                                ]),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),

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
                                        color: Colors.white)),
                                color: Color.fromRGBO(11, 71, 109, 1.0)),
                            //here
                          ],
                        ),
                    ),
                  )),
            ), // further items here
          ],
        ),
      ),
    );
  }
}
