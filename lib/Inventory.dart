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


void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: inventory()
  ));
}

class inventory extends StatefulWidget {
  @override
  _inventoryState createState() => _inventoryState();
}

class _inventoryState extends State<inventory> {
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue,1.0),
      appBar: std_appbar('Inventory', color_Red, color_Green, color_Blue),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue,1.0),
      //   title: Text(
      //     'Inventory',
      //     style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white)),
      //   ),
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(Icons.arrow_back_ios),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {} ,
      //       icon: Icon(Icons.menu),
      //       )
      //   ],
      //   ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white ,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //          IconButton(
      //            color: Color.fromRGBO(11, 71, 109, 1.0),
      //            iconSize: 24.0,
      //            icon: Icon(Icons.add_chart),
      //           onPressed: () {}
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
      //             child: Text(
      //                'Report',
      //                style:  GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0))),
      //             ),
      //           )
      //         ],
      //         ),
      //           Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: <Widget>[
      //               IconButton(
      //            color: Color.fromRGBO(11, 71, 109, 1.0),
      //            iconSize: 24.0,
      //            icon: Icon(Icons.business_center_outlined),
      //           onPressed: () {}
      //           ),
      //           Text(
      //              'Inventory',
      //              style:  GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0))),
      //           )

      //             ],
      //           )
      //     ],
      //   )
      //   ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
          onPressed: (){},
          child: Icon(Icons.add,color: Colors.white),
          ),
          bottomNavigationBar: std_chinbar(color_Red,color_Green,color_Blue),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
            child: Text(
              'Search bar to be implemented',
            ),
          ),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.8,
                      child: inventory_lis(items: Inventory.getinventory())
                      )
                  ],
                  ),
              ),
            ),
          )
        ],
        ),
      
    );
  }
}

