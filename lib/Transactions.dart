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


void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: transactions()
  ));
}

class transactions extends StatefulWidget {
  @override
  _transactionsState createState() => _transactionsState();
}

class _transactionsState extends State<transactions> {
  int currentState;
  @override
  void initState(){
    super.initState();
    currentState=0;
  }
  @override
  Widget build(BuildContext context) {
    int color_Red = 11;
    int color_Green = 71;
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
      appBar: std_appbar(context, 'Transactions', color_Red, color_Green, color_Blue),
      bottomNavigationBar: std_chinbar(context, color_Red, color_Green, color_Blue),
      floatingActionButton:  FloatingActionButton(
          backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
          onPressed: (){},
          child: Icon(Icons.add,color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                //height: 250,
                width: phone_width,
                //color: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
                child: Align(
                  alignment: Alignment.center,
                                  child: Container(
                                    height: slider_height,
                                    width: slider_width,
                                    child: CupertinoSlidingSegmentedControl(
                     groupValue: currentState,
                     //backgroundColor: Color.fromRGBO(118, 118, 128, 1.0),
                     backgroundColor: Colors.grey[100],
                     children: <int, Widget>{
                       0: Text('Sale',
                           style: TextStyle(
                              // color: Color.fromRGBO(11, 71, 109, 1.0),
                              color: Colors.black,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                              fontSize: 14,

                             )
                          ),
                       1: Text('Expenses',
                           style: TextStyle(
                             //color: Color.fromRGBO(11, 71, 109, 1.0),
                             color: Colors.black,
                             fontFamily: "Lato",
                             fontWeight: FontWeight.bold,
                             fontSize: 14,
                           )
                         ),
                         2: Text('Purchase',
                           style: TextStyle(
                             //color: Color.fromRGBO(11, 71, 109, 1.0),
                             color: Colors.black,
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
                        // Stack(
                        //   children: <Widget>[
                        //     currentState==0?
                        //     Column(
                        //       children: [
                        //         sale_purchase_head(context),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height *0.8,
                        //           child: sale_purchase_lis(items: Inventory.getinventory())
                        //         )
                        //       ],
                        //     ):Text(''),
                        //     currentState==1?
                        //     Column(
                        //       children: [
                        //         expenses_head(context),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height *0.8,
                        //           child: expenses_lis(items: Inventory.getinventory())
                        //         )
                        //       ],
                        //     ):Text(''),
                        //     currentState==2?
                        //     Column(
                        //       children: [
                        //         sale_purchase_head(context),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height *0.8,
                        //           child: sale_purchase_lis(items: Inventory.getinventory())
                        //         )
                        //       ],
                        //     ):Text('')
                        //   ]
                        // ),

                        //sale_purchase_head(context),
                        //inventory_lis(items: Inventory.getinventory())
                      ],
                      ),
                  )
                )
                )

            ],
            ),

    );
  }
}
