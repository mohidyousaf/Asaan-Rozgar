//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
 import 'package:asaanrozgar/Widgets/action_sheet.dart';

Widget sale_purchase_head(BuildContext context){
  return Container(
    padding: EdgeInsets.only(top: 30.0),
    child: Column(
      children: [
        Table(
          children: [
             TableRow( children: [  
                            Column(children:[
                              Text(
                                'Date',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12.0)),
                              ]),  
                            Column(children:[
                              Text(
                                'Itemname',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12.0))]),  
                            Column(children:[
                              Text(
                                'Quantity',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12.0),
                                 )]),
                            Column(children:[
                              Text(
                                'Price',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12.0),
                                 )]),  
                          ])
          ],
          ),
          Divider(
            indent: 33.0,
            endIndent: 33.0,
            color: Colors.grey
          )
      ],
    )
  );
}




Widget expenses_head(BuildContext context){
  return Container(
    padding: EdgeInsets.only(top: 30.0),
    child: Column(
      children: [
        Table(
          children: [
             TableRow( children: [  
                            Column(children:[
                              Text(
                                'Date',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12.0)),
                              ]),  
                            Column(children:[
                              Text(
                                'Type',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12.0))]),  
                            Column(children:[
                              Text(
                                'Price',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12.0),
                                 )]),  
                          ])
          ],
          ),
          Divider(
            indent: 33.0,
            endIndent: 33.0,
            color: Colors.grey
          )
      ],
    )
  );
}


