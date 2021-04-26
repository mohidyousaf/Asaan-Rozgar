//Inventory List Widget
//This page is used to create the list of items in the inventory.

import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class inventory_lis extends StatefulWidget {
  //This contains the data of each item.
  final List <InventoryItem> itemList;
  inventory_lis({this.itemList});
  final _key = GlobalKey<AnimatedListState>();
  @override
  _inventory_lisState createState() => _inventory_lisState();
}

class _inventory_lisState extends State<inventory_lis> {
  var model;

  Func(context, index){
    widget._key.currentState.removeItem(
        index, (context, animation) => inventoryItems(context, index, animation),
        duration: const Duration(milliseconds: 300));
    Future.delayed(Duration(milliseconds: 250)).then((value) => model.removeItem(index));
  }
  Widget inventoryItems(BuildContext context, int index, animation) {
    var item = widget.itemList[index];
    return SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child:Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: TextButton(
        onPressed: (){
          Navigator.pushNamed(context, '/itemReport');
        },
        child: Container(
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
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap:(){},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async{
            await myAlert(context, Func, index);
          },
        ),
      ],
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    model = Provider.of<InventoryModel>(context, listen: false);
    //This contans a list of items that are both tappable and slidable.
         return AnimatedList(
            key: widget._key,
            initialItemCount: widget.itemList.length,
            itemBuilder: (context, index, animation) {
              return inventoryItems(context, index, animation); // Refer step 3
            },
          );

        }
}
myAlert(BuildContext context, func, index)async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.delete, color: Colors.red,size: 50,),
              Text('Delete Item ?', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)))
            ],
          ),
          content: Text('Do you really want to delete Item ?', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey))),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                // true here means you clicked ok
              },
              style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
              ),
              child: Text('Cancel', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey))),
            ),
            Padding(
              padding: const EdgeInsets.only(right:14.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
                ),
                child:  Text('Delete', style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.white, ),)),
                onPressed: () {
                  func(context, index);
                  Navigator.of(context).pop(true);
                  // true here means you clicked ok
                },
              ),
            ),
          ],
        );
      },
    );
  }
