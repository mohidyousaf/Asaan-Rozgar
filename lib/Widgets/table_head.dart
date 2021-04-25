//Table Head Widgets
//This page contains all the different table headings that are used by different parent classes.
//Only one of the table head has been fully commented.
//Every Single Table follows the same method with additional text widgets only.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/action_sheet.dart';

//This is table head widget for sale and purchase.
Widget sale_purchase_head(BuildContext context){
  return Container(
    padding: EdgeInsets.only(top: 5.0),
    //This contains the headings for the table: Date, Itemname, Quantity, Price.
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:5.0),
          child: Table(
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
        ),
        
          //The table header is seperated from the table with a divider.
          Divider(
            indent: 33.0,
            endIndent: 33.0,
            color: Colors.grey
          )
      ],
    )
  );
}



//This is the table head widget for expenses.
Widget expenses_head(BuildContext context){
  return Container(
    padding: EdgeInsets.only(top: 5.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Table(
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

//This is table head widget for inventory in the item details parent class.
Widget inventory_head(BuildContext context){
  return Container(
    padding: EdgeInsets.only(top: 30.0),
    child: Column(
      children: [
        Table(
          children: [
             TableRow( children: [  
                            Column(children:[
                              Text(
                                'No.',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 12.0,fontWeight: FontWeight.bold)),
                              ]),  
                            Column(children:[
                              Text(
                                'Purchase Price',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 12.0,fontWeight: FontWeight.bold))]),  
                            Column(children:[
                              Text(
                                'Quantity',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 12.0,fontWeight: FontWeight.bold),
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


//This is the table head widget for the transactions in the item details parent class.
Widget inventory_transactions_head(BuildContext context){
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