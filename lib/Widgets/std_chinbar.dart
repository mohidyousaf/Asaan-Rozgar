import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget std_chinbar(context, int color_red,int color_green, int color_blue){
  return BottomAppBar(
        color: Colors.white ,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_chart, color: Color.fromRGBO(11, 71, 109, 1.0), size: 24.0,),
                      Text('Report', style:  GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)))),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/reportsHome');
                  }
              ),
              TextButton(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.business_center_outlined, size: 24.0,color: Color.fromRGBO(11, 71, 109, 1.0),),
                    Text('Inventory', style:
                    GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0))),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/inventory');
                },
              ),
            ]
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
