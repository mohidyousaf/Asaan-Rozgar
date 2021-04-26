//Add expenses 3 page
//This page creates the last step of the add expenses process, the confirmation.

import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/PartyNames.dart';
import 'package:provider/provider.dart';
import 'DataBase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:asaanrozgar/dashboard.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: add_expenses3()
  ));
}

//Parent class for add expenses 3.
class add_expenses3 extends StatefulWidget {
  @override
  _add_expenses3State createState() => _add_expenses3State();
}

class _add_expenses3State extends State<add_expenses3> {
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    List<ChildButton> buttons = [ChildButton(label: 'Add Expense', icon: Icon(Icons.person, color: Colors.white,), route: '/addExpense')];
    int color_Red = 12;
    int color_Green = 109;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    //Creates the skeleton of the page.
    return Scaffold(
      backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
      appBar: std_appbar(context, 'Type entered', color_Red, color_Green, color_Blue),
      bottomNavigationBar: std_chinbar(context, color_Red, color_Green, color_Blue),
      floatingActionButton: std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //Creates the body of the page.
      body: Column(
        children: <Widget> [
          //Creates the progress bar below the app bar.
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: phone_width,
                  color: Color.fromRGBO(52, 199, 89, 1.0),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                  children: <Widget> [
                    //Creates the paid icon + text for the confirmation.
                    Container(
                      margin: EdgeInsets.only(top:150.0),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget> [
                          Image.asset('assets/money 1.png',height: 108,width: 100,),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check,
                                color: Color.fromRGBO(11, 71, 109, 1.0),
                                size: 25,
                              ),
                              Text(
                                'Paid',
                                style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0),fontSize: 25 )),
                                )
                          ],)
                        ]
                      )
                    ),
                    SizedBox(height: 250.0),
                    //Creates the button to return from add expenses.
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      padding: EdgeInsets.only(left: 10.0),
                      child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                            },
                            height: 30,
                            minWidth: 90,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text('Home',
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10.0,
                                    color: Colors.white
                                )),
                            color: Color.fromRGBO(11, 71, 109, 1.0)),
                    ),
                  ]
                ) ,
                ) ,
              ),
          )
        ]
      ),
    );
  }
}