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

class inventory_lis extends StatelessWidget {
  final List <InventoryItem> items;
  inventory_lis({this.items});
  
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
                  child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                      //Insert the dynamic image variable here.
                      child: Image(image: AssetImage('assets/Frame 8.png'),height: 80.0,width: 80.0,
                      )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          //The Name of the item is being displayed here so change variable accordingly
                          '${item.name}',
                          style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontWeight: FontWeight.bold,fontSize: 20.0),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    //mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Sale Price(Rs.)',
                                     style: GoogleFonts.lato(textStyle: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 12.0
                                       )),
                                  ),
                                  Text(
                                    //The Price of the item is being displayed here so change variable accordingly
                                  '${item.price}',
                                   style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                              ),
                                ],
                              ),
                              SizedBox(width: 35.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Quantity',
                                     style: GoogleFonts.lato(textStyle: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 12.0,
                                       )),
                                  ),
                                  Text(
                                    //The quantity of the item is being displayed here so change variable accordingly
                                 '${item.quantity}',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                               ),

                                ],
                              ),
                              SizedBox(width: 35.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Value(Rs.)',
                                     style: GoogleFonts.lato(textStyle: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 12.0,
                                       )),
                                  ),
                                  Text(
                                    //The Value of the item is being displayed here so change variable accordingly
                                 '${item.value}',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                               ),
                                ],
                              )
                            ],
                            ),
                        ),
                      ],
                      )
                  ],
                  )
              )
            ],
            ),
        );
      }


      
    );
  }
}


