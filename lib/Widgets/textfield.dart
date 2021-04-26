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

  InputTextFields({this.initial:'',this.label,this.controller, this.validateFunc, this.arg});
  final String label;
  final TextEditingController controller;
  final String Function({String text,int args}) validateFunc;
  final arg;
  final initial;


  @override
  _InputTextFieldsState createState() => _InputTextFieldsState();
}
class _InputTextFieldsState extends State<InputTextFields> {
  String val;

  @override
  initState(){
    super.initState();
    val = widget.initial;
  }
  onChanges(text){
      val = text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller..text = val,
        cursorColor: Colors.lightBlue,
        obscureText: widget.label=='Password' ? true : false,
        validator: (text) {
          return widget.validateFunc(text:text, args:widget.arg);

        },
        onChanged: (text){
          onChanges(text);
        },
        decoration: InputDecoration(
          // border: InputBorder.none,
          // focusedBorder: InputBorder.none,
          // enabledBorder: InputBorder.none,
          // errorBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
          labelText:'${widget.label}',
          labelStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              )),
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


