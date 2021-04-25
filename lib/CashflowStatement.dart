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
import 'package:shared_preferences/shared_preferences.dart';


// void main() => runApp(MaterialApp(home: CashflowReport()));

class CashflowReport extends StatefulWidget {
  @override
  _CashflowReportState createState() => _CashflowReportState();
}

class _CashflowReportState extends State<CashflowReport> {
  Map<String, double> dataMap = {
    'BILLS': 1,
    'SALARY': 1,
    'RENT': 1,
  };
  double netIncome = 12000;
  int depreciation = 0;
  double increaseAccPayable = 1000;
  double increaseAccRcv = 8000;
  double increaseInventory = 7000;
  double netCashOperations = 256000;
  double purchaseEquipment = 1000;
  double notesPayable = 0;
  double cashFlow = 244700;
  List<report_items> objects=[];

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

    return ChangeNotifierProvider(
        create:(context) => CashModel(),
        child:
          Scaffold(
          backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * .08,
            leading: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text("Cash Flow Statement",
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
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: percChart(
                                          0.3,
                                          Color.fromRGBO(11, 71, 109, 1),
                                          "30%",
                                          "Opex Ratio"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: percChart(
                                          0.84,
                                          Color.fromRGBO(24, 153, 161, 1),
                                          "84%",
                                          "Gross Profit Margin"),
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
                                          Text("In flow",
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
                                          Text("Out Flow",
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
                                          Text("Net Flow",
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30.0),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Cash Flow Report",
                                      style: TextStyle(
                                        color: Color.fromRGBO(11, 71, 109, 1),
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.03),
                                  Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("CASH FLOW FROM OPERATIONS",
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

                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 5),
                                      Text("Net Income",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          )),
                                      Spacer(),

                                      Consumer<CashModel>(
                                        builder: (context,model,child){
                                          netIncome = model.income;
                                          return  Text(netIncome.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ));
                                        },
                                      )

                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.013),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 5),
                                      Text("ADDITION TO CASH",
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
                                          0.015),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 5),
                                      Text("Depreciation",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          )),
                                      Spacer(),
                                      Text(depreciation.toString(),
                                          style: TextStyle(
                                            color: Colors.teal[900],
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
                                      Text("Increase in Account payable",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          )),
                                      Spacer(),


                                      Consumer<CashModel>(
                                        builder: (context,model,child){
                                          double increaseAccPayable = model.totalPayables;
                                          return Text('+${increaseAccPayable.toString()}',
                                              style: TextStyle(
                                                color: Colors.teal[900],
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                              ));
                                        },
                                      )

                                    ],
                                  ),
                                  // SUBTRACTION from Cash
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.013),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 5),
                                      Text("SUBTRACTION FROM CASH",
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
                                          0.015),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 5),
                                      Text("Increase in Account Recievables",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          )),
                                      Spacer(),


                                      Consumer<CashModel>(
                                        builder: (context,model,child){
                                          increaseAccRcv= model.totalReceivables;
                                          return   Text('-${increaseAccRcv.toString()}',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                              ));
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.01),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 5),
                                      Text("Increase in Inventory",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          )),
                                      Spacer(),

                                      Consumer <CashModel>(
                                        builder: (context,model,child){
                                          increaseInventory = model.totalInventoryCost;
                                          return  Text('-${increaseInventory.toString()}',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                              ));
                                        },
                                      )

                                    ],
                                  ),

                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.024),

                                  Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("NET CASH FROM OPERATIONS",
                                            style: TextStyle(
                                              color: Color.fromRGBO(11, 71, 109, 1),
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            )),
                                        Spacer(),

                                        Consumer<CashModel>(
                                          builder : (context, model, child){
                                            netCashOperations = model.netCashOp;
                                            return Text(netCashOperations.toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ));

                                          }
                                        )

                                      ]),
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.015,
                              ),
                              // Investing
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("CASH FLOW FROM INVESTING",
                                        style: TextStyle(
                                          color: Color.fromRGBO(11, 71, 109, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        )),
                                    Spacer(),
                                    Text(" ",
                                        style: TextStyle(
                                          color: Color.fromRGBO(11, 71, 109, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        )),
                                  ]),
                              Divider(),

                              Consumer<CashModel>(
                                builder: (context,model,child){
                                  objects= model.objects;
                                  return Container(
                                    height: (objects.length > 2)? 80.0 :((objects.length)*50.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          children: objects
                                              .map((sub) => report_list(obj3: sub))
                                              .toList()),
                                    ),
                                  );
                                },
                              ),
                              //Financing
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              ),
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("CASH FLOW FROM FINANCING",
                                        style: TextStyle(
                                          color: Color.fromRGBO(11, 71, 109, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        )),
                                    Spacer(),
                                    Text(" ",
                                        style: TextStyle(
                                          color: Color.fromRGBO(11, 71, 109, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        )),
                                  ]),
                              Divider(),

                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(width: 5),
                                  Text("Notes Payable",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      )),
                                  Spacer(),
                                  Text(notesPayable.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      )),
                                ],
                              ),

                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05),
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("CASH FLOW ",
                                        style: TextStyle(
                                          color: Color.fromRGBO(11, 71, 109, 1),
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        )),
                                    Spacer(),

                                    Consumer<CashModel>(
                                      builder: (context,model,child){
                                        cashFlow = model.totalCashFlow;
                                        return Text(cashFlow.toString(),
                                            style: TextStyle(
                                              color: Color.fromRGBO(11, 71, 109, 1),
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ));
                                      },
                                    )
                                  ]),
                              Divider(),

                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                                  },
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
                      ),
                    )), // further items here
              ],
            ),
          ),
        ));
  }
}


class CashModel extends ChangeNotifier{

  double netIncome = 0;
  double payables = 0;
  double receivables = 0;
  double inventoryCost = 0;
  double netCash=0;
  double cashFlow =0;
  List<report_items> objects=[];

  get income => netIncome;
  get totalPayables => payables;
  get totalReceivables => receivables;
  get totalInventoryCost => inventoryCost;
  get netCashOp => netCash;
  get assets => objects;
  get totalCashFlow => objects.fold(netCash , (total, current) => total - (current.price));

  CashModel()  {
    var initFuture = getInformation();
    initFuture.then((voidVal) {
      notifyListeners();
    });
  }

  getInformation()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    netIncome = prefs.getDouble('netIncome');
    print('income is $netIncome');

    var ls = await DBprovider.db.getPayableReceivable();
    payables = ls[0];
    receivables= ls[1];
    inventoryCost = await DBprovider.db.getInventoryCost();
    netCash = netIncome + payables - receivables - inventoryCost;
    objects = await DBprovider.db.getAssets();

  }





}
















