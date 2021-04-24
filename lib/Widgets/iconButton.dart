import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget iconButton(String text, String imageAddress, context , routeName){
  return FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, routeName);
                      },
                      
                      height: 150,
                      minWidth: 150,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: 
                      Column(
                        children: [

                          ImageIcon(
                            AssetImage(imageAddress),
                            size: 80,
                            color: Colors.white,
                           ),

                          Text( text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                  color: Colors.white
                              )),
                        ],
                      ),
                      color: Color.fromRGBO(11, 71, 109, 1.0)
                    );
}