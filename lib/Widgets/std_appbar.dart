import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget std_appbar(context, String label,int color_redval,int color_greenval,int color_blueval){
  return AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(color_redval, color_greenval, color_blueval,1.0),
        centerTitle: true,
        title: Text(
          '$label',
          style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white), fontSize: 24.0),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {} ,
        //     icon: Icon(Icons.menu),
        //     )
        // ],
        );
}


