import 'dart:ffi';

import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Purchase2.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';

// void main() => runApp(MaterialApp(home: Purchase3()));


class Purchase3 extends StatefulWidget {
  Purchase3({this.func, this.object});
  Function func;
  InventoryItem object;

  @override
  _Purchase3State createState() => _Purchase3State();
}

class _Purchase3State extends State<Purchase3> {
  String image = "Image1";
  String name;
  int total;
  TextEditingController price = new TextEditingController();
  TextEditingController quantity = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    setState(() {
      name=widget.object.name;
    });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: std_appbar(context, 'Choose Item', 11, 71, 109),
        body: SingleChildScrollView(
          child: Column(
            children:[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.55,
                  color: Color.fromRGBO(52, 199, 89, 1.0),
                ),],),
                SizedBox(height: 20,),
                Center(
                  child: Column(
                    children: [
                      Text("Please Enter detail of your purchase below so that we",
                      style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                      )),
                      Text("will update your account reccords accordingly",
                      style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 40,),
                    Text("Image1",
                    style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Colors.black54,
                    )),
                    SizedBox(width: 20,),
                    Text(name,
                    style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    color: Colors.black,
                    )),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text("Purchase Price:",
                            style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.black54,
                          )),
                        Row(
                          children: [
                            Text("Rs.",
                            style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.black54,
                          )),
                            SizedBox(width: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                controller: price,
                                decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Quantity:",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.black54,
                          )),
                        Row(
                          children: [
                            SizedBox(width: 32,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                onChanged: (quantity){
                                  setState(() {
                                    total = int.parse(quantity) *  int.parse(price.text);
                                  });
                                },

                                controller: quantity,
                                decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              ),),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Text("Sub Total:",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Color.fromRGBO(11, 71, 109, 1.0),
                              )),
                            SizedBox(height: 5,),
                            Text(total.toString(),
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                                color: Color.fromRGBO(11, 71, 109, 1.0),
                              )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        onPressed: () {
                          int temp1 =int.parse(price.text);
                          int temp2 =int.parse(quantity.text);
                          //TODO: HAVE TO CHANGE STATE OF CATALOG HERE (CONSUMER)
                          Provider.of<CartModel>
                              (context, listen: false).addItems(new addItem(
                                  itemName:this.name,
                                  price: temp1,
                                  quantity: temp2,
                                  image: 'image'));
                          widget.func(screenName:'catalog');
                          // Navigator.pushNamed(context, '/purchase2', arguments: {
                          //   'obj': addItem(itemName:name, price:temp1 , quantity:temp2, image:'Image1'),
                          // } );
                        },
                        height: 30,
                        minWidth: 90,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                        child: Text('SAVE',
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal,
                              fontSize: 10.0,
                              color: Colors.white
                            )),
                        color: Color.fromRGBO(11, 71, 109, 1.0)),
                        SizedBox(width: 50,),
                  ],
                )

                    ]),
        ));
  }
}

