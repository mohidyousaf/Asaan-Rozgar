//Filter + Info Widget
//This page contains the widget for filter and information at top of the party page.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/action_sheet.dart';
import 'package:asaanrozgar/Parties_info.dart';
import 'package:asaanrozgar/main.dart';

//Widget used in the party flow.
Widget filter_info(context){
  //Returns a button for filter and information, divided by a divider underneath.
  return Container(
                      child: Column(
                        children: [
                          Row(
                           children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.657, 0.0, 0.0, 0.0),
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
                                    onPressed: () {party_filter(context);},
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
                                      Icons.info_outline,
                                      color: Colors.blue,
                                      semanticLabel: 'Info',
                                      ), 
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/parties_info');
                                    },
                                    ),
                                    Text(
                                      ' '
                                    )
                                ],
                              ),
                            )
                           ],
                          ),
                          Divider(
                           // height: 50.0,
                            indent: 15.0,
                            endIndent: 15.0,
                            //thickness: 1.0,
                            color: Colors.grey,
                          )
                        ],
                        ),
                    );
}


