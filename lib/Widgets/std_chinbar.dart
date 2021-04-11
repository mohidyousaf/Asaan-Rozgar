import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget std_chinbar(context, int color_red,int color_green, int color_blue){
  return BottomAppBar(
        color: Colors.white ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               IconButton(
                 color: Color.fromRGBO(11, 71, 109, 1.0),
                 iconSize: 24.0,
                 icon: Icon(Icons.add_chart),
                onPressed: () {}
                ),
                Text(
                   'Report',
                   style:  GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0))),
                )
              ],
              ),
              
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                 color: Color.fromRGBO(11, 71, 109, 1.0),
                 iconSize: 24.0,
                 icon: Icon(Icons.business_center_outlined),
                onPressed: () {
                   Navigator.pushNamed(context, '/inventory');
                }
                ),
                Text(
                   'Inventory',
                   style:  GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0))),
                )

                  ],
                )
          ],
        )
        );

}
Widget action_button (int color_red,int color_green, int color_blue) {
  return FloatingActionButton(
          backgroundColor: Color.fromRGBO(color_red, color_green, color_blue, 1.0),
          onPressed: () {},
          child: Icon(Icons.add,color: Colors.white),
          );
}
