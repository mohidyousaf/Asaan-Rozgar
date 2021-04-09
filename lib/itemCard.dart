
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';


class cart extends StatelessWidget {
  final itemList obj1;
  cart({this.obj1});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
                          onPressed: () {},
                          height: 50,
                          minWidth: 300,
                          child: Row(children: [
                          Text( obj1.image.toString(),
                          style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Color.fromRGBO(136, 182, 211, 0.67)
                        )),
                          SizedBox(width: 15,),
                          Text( obj1.itemName.toString(),
                          style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        )),
                        ],), 
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
          width: MediaQuery.of(context).size.width *
              0.04,
        ),
        Text(obj.image.toString()),
        SizedBox(
            width:
            MediaQuery.of(context).size.width *
                0.04),
        Row(
          children: [
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('>',
                            style: TextStyle(
                              fontFamily: "Lato",
                              // fontWeight:
                              // FontWeight.w600,
                              fontSize: 18.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 1.0),
                            )),
                        Text(" ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 18.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 1.0),
                            )),
                        Text(
                            obj.itemName
                                .toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 18.0,
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
                          fontWeight:
                          FontWeight.w600,
                          fontSize: 12.0,
                          color: Color.fromRGBO(
                              38, 51, 58, 0.6),
                        )),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(
                width: MediaQuery.of(context)
                    .size
                    .width *
                    0.25),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                            (obj.quantity *
                                obj.price)
                                .toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 18.0,
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
                        Text(
                            (obj.quantity)
                                .toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 0.6),
                            )),
                        Text(" x Rs. ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 0.6),
                            )),
                        Text(
                            (obj.price)
                                .toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 0.6),
                            )),
                        Text(" = ",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 0.6),
                            )),
                        Text(
                            (obj.quantity *
                                obj.price)
                                .toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 12.0,
                              color: Color.fromRGBO(
                                  38, 51, 58, 0.6),
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
    );;
  }
}
