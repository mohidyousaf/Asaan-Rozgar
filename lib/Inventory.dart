//import 'package:asaanrozgar/Widgets/searchbar.dart';
import 'package:asaanrozgar/Widgets/filter_reports.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
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
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';


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
    var  _suggestion= new TextEditingController();
    List<ChildButton> buttons = [ChildButton(label: 'Add Item', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/addItem')];
    return ChangeNotifierProvider(
      create: (context) => InventoryModel(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue,1.0),
        appBar: std_appbar(context, 'Inventory', color_Red, color_Green, color_Blue),
          floatingActionButton: std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
            bottomNavigationBar: std_chinbar(context, color_Red,color_Green,color_Blue),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          //TODO: NEED TO IMPLEMENT SEARCH BAR
          children: [
            SizedBox(height: 30,),
            Container(
              width: 350,
              height: 50,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Consumer<InventoryModel>(
                builder: (context,items,child){
                  var lis= items.getItems;
                  var temp=[];
                  lis.forEach((element)=>{
                    temp.add(element.name)
                  });
                  print(temp);
                  return AutoCompleteTextField(
                      controller: _suggestion,
                      suggestions:  temp,
                      clearOnSubmit: false,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          )
                      ),
                      itemFilter: (item,query){
                        return item.toLowerCase().startsWith(query.toLowerCase());
                      },

                      itemSorter: (a,b){
                          return a.compareTo(b);
                      },

                      itemSubmitted: (item){
                          _suggestion.text= item;
                      },

                      itemBuilder: (context,item){
                          return Container(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  item,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          );
                      },

                  );
                },
              ),
            ),

            SizedBox(height: 30,),
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
                      filter_reports(context),
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

