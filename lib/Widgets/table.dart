import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/temp.dart';

class sale_purchase_lis extends StatelessWidget {
  final List <InventoryItem> items;
  sale_purchase_lis({this.items});
  
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
                            Text('02/01/2021', style: GoogleFonts.lato(fontSize: 14.0)
                            )]),
                        ),  
                        Column(children:[
                          Text('Lays', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),  
                        Column(children:[
                          Text('10', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),
                        Column(children:[
                          Text('Rs.50', style: GoogleFonts.lato(fontSize: 14.0)
                          )]),  
                      ]), 
             ],
             )
          );
      }


      
    );
  }
}


class expenses_lis extends StatelessWidget {
  final List <InventoryItem> items;
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
             )
          );
      }


      
    );
  }
}

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