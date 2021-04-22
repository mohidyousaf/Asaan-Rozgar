//import 'package:asaanrozgar/Widgets/searchbar.dart';
import 'package:asaanrozgar/Widgets/filter_reports.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

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


class item_report extends StatefulWidget {

  @override
  _item_reportState createState() => _item_reportState();
}

class _item_reportState extends State<item_report> {
  List<String> monthList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep','Oct', 'Nov', 'Dec'];
  List<String> dayList = ['Mon','Tues','Wed','Thur','Fri','Sat','Sun'];
  List<String> yearList = ['2010','2011','2012','2013','2014','2015','2016'];
  String day='Mon';
  String month = 'Jan';
  String year='2010';
  int currentState=0;
  @override
  void changeMonth({type,arr,current}){
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
    int color_Red = 255;
    int color_Green = 159;
    int color_Blue = 10;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double longBtt_width = phone_width * 0.487;
    double longBtt_height = phone_height* 0.051;
    double image_height=  phone_height * 0.20;
    double image_width = phone_width *0.5;
    double textfield_gap = phone_height *0.0125; 
    double button_gap = phone_height *0.063;
    double divider_width = phone_width * 0.8;
    double slider_width=phone_width*0.834;
    double slider_height=phone_height*0.0417;
    List<ChildButton> buttons = [ChildButton(label: 'Add Item', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/addItem')];
    return Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue,1.0),
        appBar: std_appbar(context, 'Item Details', color_Red, color_Green, color_Blue),
          floatingActionButton: std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
            bottomNavigationBar: std_chinbar(context, color_Red,color_Green,color_Blue),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Frame 7.png',height: 91, width: 91,),
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
                    children: <Widget> [
                      Stack(
                        children: [
                          currentState==0?
                          Container(
              padding: EdgeInsets.only(bottom:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      changeMonth(type: 'dec',arr: dayList,current: 'day');
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
                      changeMonth(type: 'inc',arr: dayList,current: 'day');
                    },
                    iconSize: 18,
                  ),
                ],
                ),
            ): Text(''),
            currentState==1?
            Container(
              padding: EdgeInsets.only(bottom:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      changeMonth(type: 'dec',arr: monthList,current: 'month');
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
                      changeMonth(type: 'inc',arr: monthList,current: 'month');
                    },
                    iconSize: 18,
                  ),
                ],
                ),
            ): Text(''),
            currentState==2?
            Container(
              padding: EdgeInsets.only(bottom:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      changeMonth(type: 'dec',arr: yearList,current: 'year');
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
                      changeMonth(type: 'inc',arr: yearList,current: 'year');
                    },
                    iconSize: 18,
                  ),
                ],
                ),
            ): Text(''),
                        ],
                        ),

                      Container(
                //height: 42,
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
              SizedBox(height: 50.0),
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
                      Text('Hello')
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
