import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: AddItem()));

class AddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight:  MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Add Item",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(250, 250, 250, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                )),
            child: Column(
              children: [
                Container(
                  child: SizedBox(height: 20),
                ),
                Container(
                    child: FlatButton.icon(
                        onPressed: () {},
                        padding: EdgeInsets.fromLTRB(80, 25, 80, 25),
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        icon: Icon(Icons.add_a_photo),
                        label: Text("          Upload Photo"))),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Product Name"),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Parnter Name (optional)"),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Category Tag"),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Purchase Price"),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Sale Price"),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Tax Rate"),
                ),
                Container(
                    height: 35,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    child: Row(
                      children: [
                        Text("Quantity"),
                        SizedBox(width: 100),
                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color.fromRGBO(118, 118, 128, 0.12)
                          ),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              Text("-"),
                              SizedBox(width: 5),
                              Container(
                                height: 15,
                                child: VerticalDivider()
                              ),
                              SizedBox(width: 5),
                              Text("1"),
                              SizedBox(width: 5),
                              Container(
                                height: 15,
                                child: VerticalDivider()
                              ),
                              SizedBox(width: 5),
                              Text("+"),
                            ],
                          )
                        )
                      ],
                    )),
                Container(
                    height: 35,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    child: Row(
                      children: [
                        Text("Minimum Stock"),
                        SizedBox(width: 55),
                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color.fromRGBO(118, 118, 128, 0.12)
                          ),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              Text("-"),
                              SizedBox(width: 5),
                              Container(
                                height: 15,
                                child: VerticalDivider()
                              ),
                              SizedBox(width: 5),
                              Text("1"),
                              SizedBox(width: 5),
                              Container(
                                height: 15,
                                child: VerticalDivider()
                              ),
                              SizedBox(width: 5),
                              Text("+"),
                            ],
                          )
                        )
                      ],
                    )),
                SizedBox(height: 40),
                Container(
                  child: long_circleBtt("Proceed"),
                )
              ],
            ),
          ),
        ));
  }
}

Widget input_text_fields(String label) {
  return TextField(
      cursorColor: Colors.lightBlue,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: '$label',
        hintStyle: GoogleFonts.lato(
            textStyle: TextStyle(
          color: Color.fromRGBO(60, 60, 67, 0.3),
          fontSize: 14,
        )),
      ));
}

Widget long_circleBtt(String label) {
  return Container(
    height: 40.0,
    width: 200.0,
    child: Material(
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: Colors.grey[900],
      color: Color.fromRGBO(255, 159, 10, 1.0),
      elevation: 7.0,
      child: GestureDetector(
        onTap: () {},
        child: Center(
          child: Text(
            '$label',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
      ),
    ),
  );
}
//child: RaisedButton.icon(
//          onPressed: () {},
//          icon: Icon(Icons.add_a_photo),
//          label: Text("Upload Photo")
//          )
