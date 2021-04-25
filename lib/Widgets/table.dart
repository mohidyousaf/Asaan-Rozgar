//Table Head Widgets
//This page contains all the different tables that are used by different parent classes.
//Only one of the tables has been fully commented.
//Every Single table follows the same method with additional text widgets only.

import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:asaanrozgar/Transactions.dart';

//This is the table for sale and purchase. 
class sale_purchase_lis extends StatelessWidget {
  //The list that contains data for the table.
  final List<SalePurchaseItem> items;
  sale_purchase_lis({this.items});
  
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
     double phone_width= MediaQuery.of(context).size.width;
     double phone_height=MediaQuery.of(context).size.height;
    //A list is created that is divided by dividers.
    return ListView.separated(
      separatorBuilder: (context,index){
        return Divider(
          indent: 33.0,
          endIndent: 33.0,
          color: Colors.grey,
        );
      },
      
      //Counts the items in the list.
      itemCount: items.length,
      itemBuilder: (context,index){
        final item = items[index];
        //Creates a table entry with the data from the list.
        return SingleChildScrollView(
           child:Table(
             children: [
                TableRow( children: [ 
                        //SizedBox(width: 5.0), 
                        Container(
                          padding: EdgeInsets.only(left:25.0),
                          child: Column(children:[
                            Text(item.date.toString(), style: GoogleFonts.lato(fontSize: 14.0)
                            )]),
                        ),  
                        Column(children:[
                          Text(item.name, style: GoogleFonts.lato(fontSize: 14.0)
                          )]),  
                        Column(children:[
                          Text(item.quantity.toString(), style: GoogleFonts.lato(fontSize: 14.0)
                          )]),
                        Column(children:[
                          Text(item.price.toString(), style: GoogleFonts.lato(fontSize: 14.0)
                          )]),  
                      ]), 
             ],
             )
          );
      }


      
    );
  }
}


//This is the table for expenses.
class expenses_lis extends StatelessWidget {
  final List <ExpenseItem> items;
  expenses_lis({this.items});
  
  @override
  Widget build(BuildContext context) {
     double phone_width= MediaQuery.of(context).size.width;
     double phone_height=MediaQuery.of(context).size.height;
    return ListView.separated(
      separatorBuilder: (context,index){
        return Divider(
          indent: 33.0,
          endIndent: 33.0,
          color: Colors.grey,
        );
      },
      
      itemCount: items.length,
      itemBuilder: (context,index){
        final item = items[index];
        return SingleChildScrollView(
           child:Table(
             children: [
                TableRow( children: [ 
                        //SizedBox(width: 5.0), 
                        Container(
                          padding: EdgeInsets.only(left:25.0),
                          child: Column(children:[
                            Text(item.date.toString(), style: GoogleFonts.lato(fontSize: 14.0)
                            )]),
                        ),    
                        Column(children:[
                          Text(item.type, style: GoogleFonts.lato(fontSize: 14.0)
                          )]),
                        Column(children:[
                          Text(item.price, style: GoogleFonts.lato(fontSize: 14.0)
                          )]),  
                      ]), 
             ],
             )
          );
      }


      
    );
  }
}


//This is the table for item details.
class item_details_list extends StatelessWidget {
  final List <temporary> temps;
  item_details_list({this.temps});
  
  @override
  Widget build(BuildContext context) {
     double phone_width= MediaQuery.of(context).size.width;
     double phone_height=MediaQuery.of(context).size.height;
    return ListView.separated(
      separatorBuilder: (context,index){
        return Divider(
          indent: 33.0,
          endIndent: 33.0,
          color: Colors.grey,
        );
      },
      
      itemCount: temps.length,
      itemBuilder: (context,index){
        final item = temps[index];
        return Table(
             children: [
                TableRow( children: [ 
                        //SizedBox(width: 5.0), 
                        Container(
                          padding: EdgeInsets.only(left:25.0),
                          child: Column(children:[
                            Text('02/01/2021', style: GoogleFonts.lato(fontSize: 14.0)
                            )]),
                        ),    
                        Column(children:[
                          Text('Equipment', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),
                        Column(children:[
                          Text('Rs.50', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),  
                      ]), 
             ],
             );
      }


      
    );
  }
}

//This is the table for transactions in item details.
class item_transactions_list extends StatelessWidget {
  final List <temporary> temps;
  item_transactions_list({this.temps});
  
  @override
  Widget build(BuildContext context) {
     double phone_width= MediaQuery.of(context).size.width;
     double phone_height=MediaQuery.of(context).size.height;
    return ListView.separated(
      separatorBuilder: (context,index){
        return Divider(
          indent: 33.0,
          endIndent: 33.0,
          color: Colors.grey,
        );
      },
      
      itemCount: temps.length,
      itemBuilder: (context,index){
        final item = temps[index];
        return Table(
             children: [
                TableRow( children: [
                        Container(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(children:[
                            Text('02/01/2021', style: GoogleFonts.lato(fontSize: 14.0)
                            )]),
                        ), 
                        Column(children:[
                          Text('Sale', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),   
                        Column(children:[
                          Text('5', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),
                        Column(children:[
                          Text('Rs.50', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),  
                      ]), 
             ],
             );
      }


      
    );
  }
}