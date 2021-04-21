import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';

class invoice_list extends StatelessWidget {
  final addItem obj2;
  invoice_list({this.obj2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text(obj2.itemName,
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Colors.black,
                  )),
              SizedBox(width: obj2.itemName.length>5 ? 100:110),
              Text(obj2.quantity.toString(),
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Colors.black,
                  )),
            SizedBox(width: obj2.quantity<100 ? 128:120),
                  Text(obj2.price.toString(),
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Colors.black,
                  )),
          ],
        ),
    );
  }
}

class cart extends StatelessWidget {
  final InventoryItem obj1;
  final Function pass;
  cart({this.obj1, this.pass});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
          onPressed: pass,
          height: 50,
          minWidth: 300,
          child: Row(
            children: [
              Text(obj1.image.toString(),
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color.fromRGBO(136, 182, 211, 0.67))),
              SizedBox(
                width: 15,
              ),
              Text(obj1.name.toString(),
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  )),
              SizedBox(
                width: 15,
              ),
              Text(obj1.quantity.toString(),
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class itemCard extends StatelessWidget {
  final addItem obj;
  itemCard({this.obj});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        Text('img'),
        // Image(image: AssetImage('assets/Plus.png'),height: 50.0,width: 50.0,),
        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('>',
                            style: TextStyle(
                              fontFamily: "Lato",
                              // fontWeight:
                              // FontWeight.w600,
                              fontSize: 14.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 1.0),
                            )),
                        Text(" ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 14.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 1.0),
                            )),
                        Text(obj.itemName.toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 14.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 1.0),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Item Subtotal",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: Color.fromRGBO(38, 51, 58, 0.6),
                        )),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text((obj.quantity * obj.price).toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 14.0,
                              color: Color.fromRGBO(
                                  11, 71, 109, 1.0),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text((obj.quantity).toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(38, 51, 58, 0.6),
                            )),
                        Text(" x Rs. ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(38, 51, 58, 0.6),
                            )),
                        Text((obj.price).toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(38, 51, 58, 0.6),
                            )),
                        Text(" = ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(38, 51, 58, 0.6),
                            )),
                        Text((obj.quantity * obj.price).toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(38, 51, 58, 0.6),
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ],
    );
    ;
  }
}
