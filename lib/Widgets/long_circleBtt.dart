import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../signup.dart';

Widget long_circleBtt(String label,int color_red, int color_green, int color_blue){
  return Container(
            height: 40.0,
            width: 200.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.grey[900],
              color: Color.fromRGBO(color_red, color_green, color_blue, 1.0),
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    '$label',
                    style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
                  ),
                ),
              ),
            ),
            );

}

//   Container long_circleBtt(String label) {
//     return Container(
//                       height: 40.0,
//                       width: 200.0,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(20.0),
//                         shadowColor: Colors.grey[900],
//                         color: Color.fromRGBO(11, 71, 109, 1.0),
//                         elevation: 7.0,
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: Center(
//                             child: Text(
//                               'Let\'s Get Started',
//                               style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
//                             ),
//                           ),
//                         ),
//                       ));
//   }
// }