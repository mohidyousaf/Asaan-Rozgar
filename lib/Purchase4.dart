import 'dart:ffi';

import 'package:asaanrozgar/Add_Item.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';

import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';

class Purchase4 extends StatefulWidget {
  Purchase4({this.func});
  Function func;
  @override
  _Purchase4State createState() => _Purchase4State();
}

class _Purchase4State extends State<Purchase4> {

  List<InventoryItem> objects = [];
  Map data ={};
  String name;

  @override
  Widget build(BuildContext context) {
    List<ChildButton> buttons = [ChildButton(label: 'Add Item', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/addItem')];
    data = ModalRoute.of(context).settings.arguments;
    setState(() {
      name = data['name'];

    });
    return ChangeNotifierProvider(
      create:(context) => CatalogModel(name),
      child: Scaffold(
          backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
          appBar: std_appbar(context, 'Choose Item', 11, 71, 109),
          floatingActionButton: std_FAB(Colors.white, 11, 71, 109, buttons, context),
          bottomNavigationBar: std_chinbar(context, 11,71,109),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.55,
                        color: Color.fromRGBO(52, 199, 89, 1.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children:<Widget>[
                  Expanded(
                    flex:6,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 20.0, 15.0, 8.0),
                        child: Consumer<CatalogModel>(
                            builder:(context, catalog, child){
                              return TextField(
                                onChanged: (text){
                                  catalog.searchItems(text);
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.search),
                                  contentPadding: EdgeInsets.fromLTRB(20,3,10,3),
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
                  ),
                  Expanded(
                    flex: 1,
                      child:Padding(
                        padding: EdgeInsets.fromLTRB(0, 9, 20, 0),
                        child: TextButton(
                        onPressed: () {
                            widget.func(screenName:'cart');
                        },
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.white,size: 30,)
                        ),
                      )),
                    ]),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22.0),
                            topRight: Radius.circular(22.0)
                        )
                    ),
                    child:Center(
                      child: Consumer<CatalogModel>(
                        builder: (context, catalog, child) {
                          objects = catalog.getItems;
                          return Column(
                              children:
                              objects.map((sub) =>
                                  cart(
                                      obj1: sub,
                                      pass: () {
                                        widget.func(
                                            screenName: 'details', object: sub);
                                      }

                                  )
                              ).toList()
                          );
                        }),
                    ),
                  ),
                ],
              ),
      )),
    );
  }
}



/*
ParentClass->children[catalog(4), purchase-quantity(3), cart(2)]
    catalog and purchase quantity changes state of cart
    maintain state of cart in parent
    ChangeNotifier( cart_list and functions to add remove items)
    ChangeNotifierProvider(Parent Class listener/observer)
    Consumer(shopping cart view, catalog view)

    class CartList extends ChangeNotifier{
        List<OderItem> cart_items = []
        addItem(){
          notifyListeners()
        }


    }
    Consumer<CartList>

 */
class CatalogModel extends ChangeNotifier{
  var partyName;
  List<InventoryItem> items = [];
  List<InventoryItem> displayItems = [];
  get getItems => displayItems.where((element) => element.display == true).toList();
  CatalogModel(name){
    partyName = name;
    var initFuture = initializeCart();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  initializeCart() async{
    items = await DBprovider.db.getItemList(partyName);
    displayItems = items;
  }
  searchItems(text) async{
    print(text);
    text = text.toLowerCase();
    displayItems = items;
    print('before $displayItems');
    RegExp match = new RegExp('^$text');
    displayItems.forEach((element) {
      if (!match.hasMatch(element.name.toLowerCase())){
        element.setBool(false);
      }
      else{
        element.setBool(true);
      }
    });
    print('after $displayItems');
    notifyListeners();
  }
}