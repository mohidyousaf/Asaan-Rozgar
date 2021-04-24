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
import 'package:asaanrozgar/DataBase.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/ReportsMenu.dart';


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
 List<report_items> objects = [];
  List<report_items> objects2 = [];
  List<Color> colorsList = [
    Color.fromRGBO(136, 182, 211, 1),
    Color.fromRGBO(38, 51, 58, 1),
    Color.fromRGBO(11,71,109, 1),  
    ];

  @override
  Widget build(BuildContext context) {
    final List<ChildButton> buttons = [ChildButton(label: 'sale', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/sale'),
                                      ChildButton(label: 'purchase', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/purchase')];

    return ChangeNotifierProvider(
        create:(context) => IncomeModel(),
        child: Scaffold(
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
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:18.0),
                                        child:
                                        Consumer <IncomeModel>(
                                          builder: (context,model,child){
                                            int ratio = model.totalOpex;
                                            return percChart(0.3, Color.fromRGBO(11, 71, 109, 1), '${ratio.toString()}%',"Opex Ratio");
                                          },
                                        )
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left:18.0),
                                        child:

                                        Consumer<IncomeModel>(
                                          builder: (context,model,child){
                                            double ratio = model.totalGross;
                                            return  percChart(0.84, Color.fromRGBO(24, 153, 161, 1), '${ratio.toInt().toString()}%',"Gross Profit Margin");
                                          },
                                        )
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

                 child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(

                        children: [
                           Text("Income Report",
                   style: TextStyle(
                     color: Color.fromRGBO(11, 71, 109, 1),
                     fontFamily: "Lato",
                     fontWeight: FontWeight.bold,
                     fontSize: 18,
                      )
                         ),
                          // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          // Row(
                          //   children: [
                          //     SizedBox(width: 10,),
                          //     Text("To: ",
                          //     style: TextStyle(
                          //       fontFamily: "Lato",
                          //       fontWeight: FontWeight.normal,
                          //       fontSize: 12.0,
                          //       color: Color.fromRGBO(107, 143, 165, 0.7),
                          //     )),
                          //     Text("16/11/2000",
                          //         style: TextStyle(
                          //           fontFamily: "Lato",
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 12.0,
                          //           color: Color.fromRGBO(11, 71, 109, 1.0),
                          //         )),
                          //         SizedBox(width: 3,),
                          //         Icon(Icons.calendar_today_rounded,
                          //         color: Color.fromRGBO(11, 71, 109, 1.0),
                          //         size: 15,),
                          //     Spacer(),
                          //     Text("From: ",
                          //     style: TextStyle(
                          //       fontFamily: "Lato",
                          //       fontWeight: FontWeight.normal,
                          //       fontSize: 12.0,
                          //       color: Color.fromRGBO(107, 143, 165, 0.7),
                          //     )),
                          //     Text("16/11/2000",
                          //         style: TextStyle(
                          //           fontFamily: "Lato",
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 12.0,
                          //           color: Color.fromRGBO(11, 71, 109, 1.0),
                          //         )),
                          //         SizedBox(width: 3,),
                          //         Icon(Icons.calendar_today_rounded,
                          //         color: Color.fromRGBO(11, 71, 109, 1.0),
                          //         size: 15,),
                          //         SizedBox(width: 10,)
                          //   ],
                          // ),
                          // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children:[

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
                         Divider(),

                         Consumer<IncomeModel>(
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
                         )


                        ],
                       ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                        Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                         Text("Total Revenue",
                         style: TextStyle(
                   color: Color.fromRGBO(11, 71, 109, 1),
                   fontFamily: "Lato",
                   fontWeight: FontWeight.bold,
                   fontSize: 14,
                    )
                         ),
                         Spacer(),

                         Consumer<IncomeModel>(
                           builder: (context,model,child){
                             double revenue = model.totalRevenue;
                             return Text(revenue.toString(),
                                 style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                                 )
                             );
                           },
                         )

                         ]
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                         Divider(),
                         Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children:[

                         Text("Expense",
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
                         Divider(),

                         Consumer<IncomeModel>(
                           builder: (context,model,child){
                             objects2= model.expenseItems;
                             return Container(
                               height: (objects2.length > 2)? 80.0 :((objects2.length)*50.0),
                               child: SingleChildScrollView(
                                 child: Column(
                    children: objects2
                        .map((sub) => report_list(obj3: sub))
                        .toList()),
                               ),
                             );
                           },
                         ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                        Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                         Text("Total Expense",
                         style: TextStyle(
                   color: Color.fromRGBO(11, 71, 109, 1),
                   fontFamily: "Lato",
                   fontWeight: FontWeight.bold,
                   fontSize: 14,
                    )
                         ),
                         Spacer(),

                         Consumer <IncomeModel> (
                           builder: (context,model,child){
                             double expense= model.totalExpense;
                             return Text(expense.toString(),
                                 style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                                 )
                             );
                           },
                         ),

                         ]
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                         Divider(),
                         SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
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
                   color: Colors.white
                                )),
                            color: Color.fromRGBO(11, 71, 109, 1.0)),
                         //here
                     ],
                   ),
               ),
             )
              ),// further items here
            ],
          ),
          ),
          )
    );
  }
}


class IncomeModel extends ChangeNotifier {
  List<report_items> objects=[];
  List<report_items> objects2=[];
  double totalGoodsCost= 0;
  double revenue =  0.0;
  double expense = 0.0;
  int opexRatio = 0;
  double grossProfit= 0;

  get saleItems => objects;
  get expenseItems => objects2;
  get totalRevenue => revenue;
  get totalExpense => expense;
  get totalOpex => opexRatio;
  get totalGross=> grossProfit;

  IncomeModel() {
    var initFuture = getSaleItems();
    initFuture.then((voidVal) {
      notifyListeners();
    });
  }

  getSaleItems() async {
    objects = await DBprovider.db.getSaleItems();
    objects2= await DBprovider.db.getExpenseItems();
    totalGoodsCost = await DBprovider.db.getTotalCost();

    objects.forEach((element) {
      revenue += element.price;
    });
    objects2.forEach((element) {
      expense += element.price;
    });
    print('i am in model');
    print(objects);
    print(objects2);

    opexRatio = (expense ~/ revenue).toInt();

    //TODO : CALCULATE GROSS PROFIT MARGIN HERE

    grossProfit = (revenue - totalGoodsCost)/(revenue) * 100;
    print('gross profit is $grossProfit');

  }
}