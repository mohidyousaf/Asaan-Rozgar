import 'dart:ffi';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Add_Item.dart';
import 'package:flutter/material.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';
import 'package:asaanrozgar/Purchase2.dart';


void main() => runApp(MaterialApp(home: Purchase_invoice()));

class Purchase_invoice extends StatefulWidget {
  final Function func;
  Purchase_invoice({this.func});
  @override
  _Purchase_invoiceState createState() => _Purchase_invoiceState();
}

class _Purchase_invoiceState extends State<Purchase_invoice> {
  // data for items added

  List<addItem> objects = [];
 // List<addItem> objects = [];

  List<String> itemName = ['Lays', 'Cheetos'];
  List<int> price = [10, 30];
  List<int> quantity = [20, 2];
  List<String> image = ['Image1', 'Image2'];

  Map data = {};
  String name ;
  bool toGive = false;
  int invoiceNo = 8;
  int _value = 1;
//  TextEditingController ProductName = new TextEditingController();
  double receivable = 1000;
  double payable = 2000;
  String Balance_message = "You will get";
  double balance = 200;
  double salesTax= 0;
  double invoiceTotal=0;
  List<Map<String, dynamic>> temp;




  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    setState(() {
      name = data['name'];
    });

    print(balance);
    print(Balance_message);

    return Scaffold(
        backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Invoice",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Color.fromRGBO(52, 199, 89, 1.0),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Icon(Icons.check,
                color: Colors.white,
                size: 20,),
                Text("PAID",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                  color: Colors.white,
                )),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  )),
              child: Padding(
                padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                child: Column(children: [
                  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width *0.3,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Purchase Invoice",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                                color: Color.fromRGBO(181, 187, 201, 1.0),
                              )),
                              SizedBox(height: 10,),
                              Text(name,
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.black,
                              )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Invoice No:  ",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            color: Color.fromRGBO(107, 143, 165, 0.8),
                          )),
                      Text("$invoiceNo",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Color.fromRGBO(11, 71, 109, 1.0),
                          )),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.32),
                      Text("Date: ",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            color: Color.fromRGBO(107, 143, 165, 0.7),
                          )),
                      Row(
                        children: [
                          Text("16/11/2000",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromRGBO(11, 71, 109, 1.0),
                              )),
                              SizedBox(width: 3,),
                              Icon(Icons.calendar_today_rounded,
                              color: Color.fromRGBO(11, 71, 109, 1.0),
                              size: 15,)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        color: Color.fromRGBO(107, 143, 165, 0.7),
                      )),
                    ],
                  ),
                  SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Product",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                  color: Colors.black54,
                                )),
                            ],
                          ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Quantity",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                  color: Colors.black54,
                                )),
                              ],
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Price (Rs.)",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                  color: Colors.black54,
                                )),
                              ],
                            ),
                        ],
                      ),
                      SizedBox(height: 10,),

                      Consumer<CartModel>(
                        builder: (context,cart,child){
                          objects= cart.cartList;
                          return   Column(
                              children: objects.map((sub) => invoice_list(obj2: sub)).toList()
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),


                      Text("Subtotal",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                            color: Colors.black54,
                          )),
                          SizedBox(height: 5,),
                      Row(
                        children: [

                          Consumer<CartModel>(
                            builder: (context,cart,child){
                              return Text(cart.totalPrice.toString(),
                                  style: TextStyle(
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ));
                            },
                          )

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Sales Tax",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                            color: Colors.black54,
                          )),
                          SizedBox(height: 5,),
                      Row(
                        children: [
                          Text(salesTax.toString(),
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Invoice Total",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                                color: Colors.black54,
                              )),
                              SizedBox(height: 5,),
                          Row(
                            children: [
                              Consumer<CartModel>(
                                builder: (context,cart,child){
                                  return Text(cart.totalPrice.toString(),
                                      style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        color: Color.fromRGBO(11, 71, 109, 1.0),
                                      ));
                                },
                              )

                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.45,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Balance",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                                color: Colors.black54,
                              )),
                              SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Rs. 0",
                                  style: TextStyle(
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                      },
                      height: 30,
                      minWidth: 90,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                      child: Text('PRINT',
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 10.0,
                            color: Colors.white
                          )),
                      color: Color.fromRGBO(11, 71, 109, 1.0)),
                ]),
              ),
            ),
          ],
        )));
  }
}
