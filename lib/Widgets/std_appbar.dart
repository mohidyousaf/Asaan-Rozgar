import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget std_appbar(String label,int color_redval,int color_greenval,int color_blueval){
  return AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(color_redval, color_greenval, color_blueval,1.0),
        centerTitle: true,
        title: Text(
          '$label',
          style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white)),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {} ,
            icon: Icon(Icons.menu),
            )
        ],
        );
}

