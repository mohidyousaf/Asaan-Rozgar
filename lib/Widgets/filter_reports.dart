//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/action_sheet.dart';

class filter_reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {
                        inventory_filter(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.filter_alt_outlined,
                              semanticLabel: 'Filter',
                              color: Color.fromRGBO(11, 71, 109, 1.0)),
                          Text('Filter',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Color.fromRGBO(
                                    11, 71, 109, 1.0))),)
                        ],
                      )),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 5.0, right: 25.0),
                    child: TextButton(
                      child: Column(
                        children: [
                          Icon(Icons.print_outlined, semanticLabel: 'Report',
                            color: Color.fromRGBO(11, 71, 109, 1.0),),
                          Text('Report', style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Color.fromRGBO(
                                  11, 71, 109, 1.0))),)
                        ],
                      ),
                    )
                )
              ]
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
}


