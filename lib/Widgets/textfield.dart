import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget input_text_fields(String label,String hinttext){
  return TextField(
                      decoration: InputDecoration(
                        labelText: '$label',
                        hintText: '$hinttext',
                        hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                        labelStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        )
                      ),
                    );
}


