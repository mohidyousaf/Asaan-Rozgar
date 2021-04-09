import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';

class Purchase3 extends StatefulWidget {
  @override
  _Purchase3State createState() => _Purchase3State();
}

class _Purchase3State extends State<Purchase3> {
  String image = "Image1";
  String name = "Lays";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Choose Item",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body: Column(
          children:[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 4,
                width: MediaQuery.of(context).size.width * 0.55,
                color: Color.fromRGBO(52, 199, 89, 1.0),
              ),],),
          Container(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 15),
                            Text(
                                "Please Enter detail of your purchase below so that we",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.0,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "will update your account reccords accordingly",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.0,
                                  ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ],
                ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text(image,
                  style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                  color: Color.fromRGBO(107, 143, 165, 0.7),
                )),
                SizedBox(width: 10,),
                Text(name,
                  style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                )),
                ],
            ),
            Text("Purchase Price",
                style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
                )),
            Text("Purchase Price",
                style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
                )),
            Row(
                children: [
                  Text("Rs. ",
                    style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    )),
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'Purchase Price',
                    hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                    labelStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    )),
                  ),
                  ],
                ),
        ]));
  }
}


Widget input_text_fields(String label){
  return TextField(
                      decoration: InputDecoration(
                        labelText: '$label',
                        hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                        labelStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        )
                      ),
                    );
}