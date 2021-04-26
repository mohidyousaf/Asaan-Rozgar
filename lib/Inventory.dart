//The Inventory Page
//This page creates the parent for inventory

import 'package:asaanrozgar/Widgets/filter_reports.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:asaanrozgar/drawer.dart';

void main() => runApp(MaterialApp(
  home: inventory(),
));

//The Parent inventory class
class inventory extends StatefulWidget {

  @override
  _inventoryState createState() => _inventoryState();
}

class _inventoryState extends State<inventory> {
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    int color_Red = 255;
    int color_Green = 159;
    int color_Blue = 10;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    List<ChildButton> buttons = [ChildButton(label: 'Add Item', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/addItem')];
    return ChangeNotifierProvider(
      create: (context) => InventoryModel(),
      //Creates the skeleton of the page
      child: Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue,1.0),
        endDrawer: drawer(),
        appBar: std_appbar(context, 'Inventory', color_Red, color_Green, color_Blue),
          floatingActionButton: std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
            bottomNavigationBar: std_chinbar(context, color_Red,color_Green,color_Blue),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            //Creates the body of the page.
        body: Column(
          //The search bar for searching through inventory items.
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
              child: Consumer<InventoryModel>(
                  builder:(context, inventory, child){
                    return TextField(
                      onChanged: (text){
                        inventory.searchItems(text);
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.fromLTRB(20,3,20,3),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              const Radius.circular(16.0),)
                        ),
                      ),
                    );
                  })
            ),
            //Creating the data visualization section of the page.
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0)
                  )
                ),
                 child: Column(
                    children: [
                      report_model(),
                      //Prints the list of items on the page.
                      Expanded(
                        child: SizedBox(
                            child:Consumer<InventoryModel>(
                            builder: (context, items, child) {
                              return inventory_lis(items: items.getItems);
                            }),
                        ),
                      ),
                    ],
                    ),
              ),
            )
          ],
          ),

      ),
    );
  }
}

class report_model extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InventoryModel>(context, listen: false);
    return filter_reports(type:'inventory',filterModel: model);
  }
}


