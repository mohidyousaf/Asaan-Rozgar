//Expenses page
//This page creates the parent for expenses .

import 'package:asaanrozgar/Widgets/filter_reports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/table_head.dart';
import 'package:asaanrozgar/Widgets/table.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';



class expenses extends StatefulWidget {
  @override
  _expensesState createState() => _expensesState();
}

class _expensesState extends State<expenses> {
  int select=0;
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    int color_Red = 12;
    int color_Green = 109;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    List<ChildButton> buttons = [ChildButton(label: 'Add Expense', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/expenses2')];
    //Creates the skeleton of the page.
    return Scaffold(
      backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
      appBar: std_appbar(context, 'Expenses', color_Red, color_Green, color_Blue),
      bottomNavigationBar: std_chinbar(context, 11, 71, 109),
      floatingActionButton: std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          //Creates the body of the page.
          body: Column(
            children:  <Widget> [
              //Creates the data visualization part of the page.
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0)
                  )
                ),
                  child: SingleChildScrollView(
                                      child: Column(
                      children: [
                        filter_reports(),
                        expenses_head(context),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height *0.8,
                        //   child: expenses_lis(items: Inventory.getinventory())
                        // )
                      ],
                      ),
                  )
                )
                )
            ]
          ),
    );
  }
}