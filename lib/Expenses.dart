//import 'package:asaanrozgar/Widgets/searchbar.dart';
import 'package:asaanrozgar/Widgets/action_sheet.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:asaanrozgar/Widgets/table_head.dart';
import 'package:asaanrozgar/Widgets/table.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: expenses()
  ));
}

class expenses extends StatefulWidget {
  @override
  _expensesState createState() => _expensesState();
}

class _expensesState extends State<expenses> {
  int select=0;
  @override
  Widget build(BuildContext context) {
    int color_Red = 12;
    int color_Green = 109;
    int color_Blue = 109;
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
      appBar: std_appbar('Expenses', color_Red, color_Green, color_Blue),
      bottomNavigationBar: std_chinbar(11, 71, 109),
      floatingActionButton:  FloatingActionButton(
          backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
          onPressed: (){},
          child: Icon(Icons.add,color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Column(
            children:  <Widget> [
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
                        filter_reports(context),
                        expenses_head(context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height *0.8,
                          child: expenses_lis(items: Inventory.getinventory())
                        )
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