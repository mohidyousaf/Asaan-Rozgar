//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
 import 'package:asaanrozgar/Widgets/action_sheet.dart';

Widget filter_reports(BuildContext context){
  return Container(
                      child: Column(
                        children: [
                          Row(
                           children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(270.0, 0.0, 0.0, 0.0),
                              alignment: Alignment.bottomCenter ,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,                
                                children: [
                                  IconButton(
                                    alignment: Alignment.center,
                                    icon: Icon(
                                      Icons.filter_alt_outlined,
                                      semanticLabel: 'Filter',
                                      ), 
                                    onPressed: () {},
                                    ),
                                    Text(
                                      'Filter',
                                      //textAlign: Alignment()
                                      style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                                    )
                                ],
                                ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget> [
                                  IconButton(
                                    alignment: Alignment.center,
                                    icon: Icon(
                                      Icons.print_outlined,
                                      semanticLabel: 'Report',
                                      ), 
                                    onPressed: () {},
                                    ),
                                    Text(
                                      'Report',
                                      //textAlign: Alignment()
                                      style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                                    )
                                ],
                              ),
                            )
                           ],
                          ),
                          Divider(
                           // height: 50.0,
                            indent: 33.0,
                            endIndent: 33.0,
                            //thickness: 1.0,
                            color: Colors.grey,
                          )
                        ],
                        ),
                    );
}


