import 'dart:ffi';

import 'package:asaanrozgar/Add_Item.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:flutter/material.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';

class Sale4 extends StatefulWidget {
  Sale4({this.func});
  Function func;
  @override
  _Sale4State createState() => _Sale4State();
}

class _Sale4State extends State<Sale4> {

  Map data ={};
  String name;
  List<InventoryItem> objects = [];

  getItemList()async{
    //TODO: Get total quantity from database
    List<InventoryItem> temp2 = await DBprovider.db.getItemList(name);
    setState(() {
      objects= temp2;
    });
  }


  @override
  void initState() {
    super.initState();
    print("init");
    // future that allows us to access context. function is called inside the future
    // otherwise it would be skipped and args would return null
    Future.delayed(Duration.zero, () {
      getItemList();
    });
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    setState(() {
      name = data['name'];

    });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Choose Item",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
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
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(11, 71, 109, 1.0),
                child: Center(child: FlatButton(
                  // have to change this to support state
                    onPressed: () {
                      widget.func(screenName:'cart');
                      // Navigator.pushNamed(context, '/Sale4',arguments: {'name': data['name']});
                    },
                    height: 30,
                    minWidth: 200,
                    child: Text('Go To Cart',
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                        )),
                    color: Color.fromRGBO(136, 182, 211, 0.67))),
              ),
              SizedBox(height: 20),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Column(
                      children:
                      objects.map((sub) => cart(
                          obj1 : sub,
                          pass: (){

                            widget.func(screenName:'details', object:sub);
                          }

                      )
                      ).toList()
                  ),
                ],
              ),
            ],
          ),
        ));
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