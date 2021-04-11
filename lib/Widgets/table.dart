import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/temp.dart';




// class inventory_list extends StatefulWidget {
//   final List <Inventory> itemlist;

//   const inventory_list({Key key, this.itemlist}) : super(key: key);

//   @override
//   _inventory_listState createState() => _inventory_listState();
// }

// class _inventory_listState extends State<inventory_list> {

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context,index){
//         return Divider(
//           color: Colors.grey,
//         );
//       },
      
//       itemCount: widget.itemlist.length,
//       itemBuilder: (context,index){
//         return Text(
//           'Inventory',
//         );
//       }


      
//     );
//   }
// }

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

 //Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Container(
          //       width: 30.0,
          //       child: Text(
          //         '02/01/2021',
          //         style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 14.0),
          //       ),
          //     ),
          //     Container(
          //       width: 50.0,
          //       //padding: EdgeInsets.only(right: 100.0),
          //       child: Text(
          //         'Lays',
          //         style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 14.0),
          //         ),
          //     ),
          //     Container(
          //       child: Text(
          //         '10',
          //         style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 14.0),
          //         ),
          //     ),
          //     Container(
          //       child: Text(
          //         'Rs.50',
          //         style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontSize: 14.0),
          //         ),
          //     ),
          //   ],
          //   ),