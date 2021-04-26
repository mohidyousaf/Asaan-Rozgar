//Item Report page.
//This page creates the report of the item selected.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter/cupertino.dart';
import 'package:asaanrozgar/Widgets/table_head.dart';
import 'package:asaanrozgar/Widgets/table.dart';
import 'package:asaanrozgar/Widgets/graph_inventory.dart';
import 'package:asaanrozgar/drawer.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: item_report()
  ));
}

//Parent class for item report.
class item_report extends StatefulWidget {

  @override
  _item_reportState createState() => _item_reportState();
}

class _item_reportState extends State<item_report> {
  //Arrays to provides the days,months and years to change the graph.
  List<String> monthList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep','Oct', 'Nov', 'Dec'];
  List<String> dayList = ['Mon','Tues','Wed','Thur','Fri','Sat','Sun'];
  List<String> yearList = ['2010','2011','2012','2013','2014','2015','2016'];
  List<String> temp = ['2010','2011','2012','2013','2014','2015','2016'];
  String day='Mon';
  String month = 'Jan';
  String year='2010';
  int currentState=0;
  int table_selector=0;
  @override
  //This functions changes the date, the month or the year on the users input.
  void change({type,arr,current}){
    print(arr);
    print(current);
    String current_val;
    int index;
    if (current=='day'){
      index = arr.indexOf(day);
    }
    if (current=='month'){
      index = arr.indexOf(month);
    }
    if (current=='year'){
      index = arr.indexOf(year);
    }
    if (type == 'inc'){
      if (index >= arr.length - 1){
        current_val = arr[0];
      }
      else{
        current_val = arr[ index + 1 ];
      }
    }
    else if (type == 'dec'){
      if (index <= 0){
        current_val = arr[arr.length - 1];
      }
      else{
        current_val = arr[ index - 1 ];
      }
    }
    print('hello' + current_val);
    if (current=='day'){
      setState((){
      day = current_val;
    });
    }
    if (current=='month'){
      setState((){
      month = current_val;
    });
    }
    if (current=='year'){
      setState((){
      year = current_val;
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    int color_Red = 255;
    int color_Green = 159;
    int color_Blue = 10;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double image_height=  phone_height * 0.113;
    double image_width = phone_width *0.22;
    double slider_width=phone_width*0.834;
    double slider_height=phone_height*0.0417;
    List<ChildButton> buttons = [ChildButton(label: 'Add Item', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/addItem')];
    //Creating the skeleton of the page.
    return Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue,1.0),
        endDrawer: drawer(),
        appBar: std_appbar(context, 'Item Details', color_Red, color_Green, color_Blue),
          floatingActionButton: std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
            bottomNavigationBar: std_chinbar(context, color_Red,color_Green,color_Blue),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            //Showing the item selected with its image and name.
            Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Frame 7.png',height: image_height, width: image_width,),
                  SizedBox(width: 30.0),
                  Column(
                    children: [
                      Text(
                        'Lays Classic',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white),fontSize: 26,fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 10.0),
                      FlatButton(
                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)
                          ),
                        color: Color.fromRGBO(255, 207, 133, 1.0),
                        child: Text(
                          'Edit Details'
                        )
                        )
                    ],)
              ],)
            ),
            SizedBox(height: 20.0),
            //Creates the data section of the page.
            Expanded(
              child: Container(
                width: phone_width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0)
                  )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    //Creates the graph on the page.
                    children: <Widget> [
                      SizedBox(height:0.0),
                      SizedBox( 
                        width: phone_width,
                        height: phone_height*0.189,
                        child: LineGraph_inventory()
                        ),
                        //Creates a button to move through either days,months or years, to adjust the graph.
                      Stack(
                        children: [
                          //Creates a button to move through days.
                          currentState==0?
                          Container(
              padding: EdgeInsets.only(bottom:5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      change(type: 'dec',arr: dayList,current: 'day');
                      },
                    iconSize: 18,
                  ),

                SizedBox(
                  width: 35,
                  child: Center(
                    child: Text(
                      day,
                      style: TextStyle(
                            color: Color.fromRGBO(136, 182, 211, 1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                             )
                      ),
                  ),
                ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      change(type: 'inc',arr: dayList,current: 'day');
                    },
                    iconSize: 18,
                  ),
                ],
                ),
            ): Text(''),
            //Creates a button to move through months.
            currentState==1?
            Container(
              padding: EdgeInsets.only(bottom:5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      change(type: 'dec',arr: monthList,current: 'month');
                      },
                    iconSize: 18,
                  ),

                SizedBox(
                  width: 35,
                  child: Center(
                    child: Text(
                      '$month',
                      style: TextStyle(
                            color: Color.fromRGBO(136, 182, 211, 1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                             )
                      ),
                  ),
                ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      change(type: 'inc',arr: monthList,current: 'month');
                    },
                    iconSize: 18,
                  ),
                ],
                ),
            ): Text(''),
            //Creates a button to move through the years.
            currentState==2?
            Container(
              padding: EdgeInsets.only(bottom:5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      change(type: 'dec',arr: yearList,current: 'year');
                      },
                    iconSize: 18,
                  ),

                SizedBox(
                  width: 38,
                  child: Center(
                    child: Text(
                      year,
                      style: TextStyle(
                            color: Color.fromRGBO(136, 182, 211, 1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                             )
                      ),
                  ),
                ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      change(type: 'inc',arr: yearList,current: 'year');
                    },
                    iconSize: 18,
                  ),
                ],
                ),
            ): Text(''),
                        ],
                        ),
                        //Creates a slider button to choose between: Days, Months, Years.
                      Container(
                width: slider_width,
                child: CupertinoSlidingSegmentedControl(
                         groupValue: currentState,
                         backgroundColor: Color.fromRGBO(118, 118, 128, 0.12),
                         children: <int, Widget>{
                           0: Text('Day',
                               style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,

                                 )
                              ),
                           1: Text('Month',
                               style: TextStyle(
                                 color: Color.fromRGBO(11, 71, 109, 1.0),
                                 fontFamily: "Lato",
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14,
                               )
                             ),
                             2: Text('Year',
                               style: TextStyle(
                                 color: Color.fromRGBO(11, 71, 109, 1.0),
                                 fontFamily: "Lato",
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14,
                               )
                             )
                         },
                         onValueChanged: (v){
                           setState(() {
                             currentState = v;
                           });
                         },
                     ),
              ),
              SizedBox(height: 30.0),
              //Prints information about the item in a specific format.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Sale Price',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 13),
                      ),
                      Text(
                        '50',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(136, 182, 211, 1.0)),fontSize: 34),
                      ),
                      Text(
                        'Stock Value',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 13),
                      ),
                      Text(
                        '1500',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(136, 182, 211, 1.0)),fontSize: 34),
                      ),
                    ]
                  ),
                   VerticalDivider(
                      color: Colors.grey,
                      //width: 100.0,
                      indent: 50.0,
                      endIndent: 50.0,
                    ),
                    Column(
                    children: [
                      Text(
                        'Sales Growth',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 13),
                      ),
                      Text(
                        '+5.6%',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(52, 199, 89, 1.0)),fontSize: 34),
                      ),
                      Text(
                        'Net Profit',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 13),
                      ),
                      Text(
                        '2500',
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(52, 199, 89, 1.0)),fontSize: 34),
                      ),
                    ]
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              //Creates a slider button to choose between: Inventory and, Transactions.
              Container(
                padding: EdgeInsets.all(15.0),
                width: phone_width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 1.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0)
                  )
                ),
                //width: slider_width,
                child: Column(
                  children: [
                    Container(
                      width: slider_width,
                      child: CupertinoSlidingSegmentedControl(
                               groupValue: table_selector,
                               backgroundColor: Color.fromRGBO(118, 118, 128, 0.12),
                               children: <int, Widget>{
                                 0: Text('Inventory',
                                     style: TextStyle(
                                        color: Color.fromRGBO(11, 71, 109, 1.0),
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,

                                       )
                                    ),
                                 1: Text('Transactions',
                                     style: TextStyle(
                                       color: Color.fromRGBO(11, 71, 109, 1.0),
                                       fontFamily: "Lato",
                                       fontWeight: FontWeight.bold,
                                       fontSize: 14,
                                     )
                                   ),
                               },
                               onValueChanged: (v){
                                 setState(() {
                                   table_selector = v;
                                 });
                               },
                           ),
                    ),
                    //Creates tha table according to the choice selected by the user.
                    Stack(children: [
                      //Creates a table for inventory.
                      table_selector==0?
                      Column(children: [
                        inventory_head(context),
                    SizedBox(
                          height: MediaQuery.of(context).size.height *0.12,
                          child: item_details_list(temps: temporary.getAll())
                        ),
                      ],):Text(''),
                      //Creates a table for transactions of an item.
                      table_selector==1?
                      Column(children: [
                        inventory_transactions_head(context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height *0.12,
                          child: item_transactions_list(temps: temporary.getAll())
                        ),
                      ]):Text('')
                    ],),
                        SizedBox(height: 10.0),
                        //Shows the total.
                        Container(
                          padding: EdgeInsets.only(left: phone_width * 0.244),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Total',
                                style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0),decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.bold))
                                ),
                                Text(
                                  '75',
                                  style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0),fontSize: 14,fontWeight: FontWeight.bold)),
                                )
                            ],
                          )
                          ),
                        SizedBox(height: 50.0)
                  ],
                ),
              ),
                    ]
                  ),
                  )
              ),
              )
          ],
          ),

      );
  }
}

