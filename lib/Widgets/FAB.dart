import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

Widget std_FAB(int color_red,int color_green, int color_blue, Icon childIcon, String label, double margin_right, double margin_left){
  return 
  SpeedDial(
          child: Icon(Icons.add),
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          marginRight: margin_right,
          marginBottom: margin_left,
          backgroundColor: Color.fromRGBO(color_red, color_green, color_blue, 1.0),
          children: [
            SpeedDialChild(
                child: childIcon,
                label: label,
                backgroundColor: Color.fromRGBO(color_red, color_green, color_blue, 1.0),
            )
          ],
        );

}
