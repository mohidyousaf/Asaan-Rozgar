import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

Widget std_FAB(Color logoColor, int color_red,int color_green, int color_blue, List<ChildButton> buttons, context){
  return 
  SpeedDial(
          child: Icon(Icons.add, color: logoColor,),
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          marginRight: MediaQuery.of(context).size.width*0.45,
          marginBottom: MediaQuery.of(context).size.width*0.1,
          backgroundColor: Color.fromRGBO(color_red, color_green, color_blue, 1.0),
          children: buttons.map((e) =>
              SpeedDialChild(
              child: e.icon,
              label: e.label,
              backgroundColor: Color.fromRGBO(color_red, color_green, color_blue, 1.0),
              onTap: (){
                  e.func(context);
              }
          )).toList(),
        );

}

class ChildButton{
  ChildButton({this.label, this.icon, this.route});
  String label;
  Icon icon;
  String route;
  func(context){
    Navigator.pushNamed(context, route);
  }

}
