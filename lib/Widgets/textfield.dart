import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//ROSHAN STYLE
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

//SHIFFA STYLE
class InputTextFields extends StatefulWidget {

  InputTextFields({this.label,this.controller, this.validateFunc});
  final String label;
  final TextEditingController controller;
  final String Function({String text}) validateFunc;

  @override
  _InputTextFieldsState createState() => _InputTextFieldsState();
}

class _InputTextFieldsState extends State<InputTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        cursorColor: Colors.lightBlue,
        obscureText: widget.label=='Password' ? true : false,
        validator: (text) {
          return widget.validateFunc(text:text);

        },
        decoration: InputDecoration(
          // border: InputBorder.none,
          // focusedBorder: InputBorder.none,
          // enabledBorder: InputBorder.none,
          // errorBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
          hintText: '${widget.label}',
          hintStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Color.fromRGBO(60, 60, 67, 0.3),
                fontSize: 14,
              )),
        ));
  }
}

// MOHID STYLE
// TextField(
// controller: Value,
// decoration: InputDecoration(
// labelText: 'Value',
// labelStyle: TextStyle(
// color: Colors.grey
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: Colors.grey)
// )
// ),
// ),


