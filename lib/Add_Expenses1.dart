import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/PartyNames.dart';
import 'package:provider/provider.dart';
import 'DataBase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';




class add_expenses1 extends StatefulWidget {
  @override
  _add_expenses1State createState() => _add_expenses1State();
}

class _add_expenses1State extends State<add_expenses1> {
  List <String> names = [];

  getParty() async{
    var temp2 = await DBprovider.db.getParties();
    setState((){
      names = temp2;
    });
  }

  @override
  void initState(){
    super.initState();
    print("hi");
    getParty();

  }
  @override
  Widget build(BuildContext context) {
    int color_Red = 12;
    int color_Green = 109;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double longBtt_width = phone_width * 0.487;
    double longBtt_height = phone_height* 0.051;
    double image_height=  phone_height * 0.052;
    double image_width = phone_width *0.149;
    double textfield_gap = phone_height *0.0125;
    double button_gap = phone_height *0.063;
    double divider_width = phone_width * 0.8;
    double slider_width=phone_width*0.834;
    double slider_height=phone_height*0.0417;
    double image_container_width=phone_width*0.219;
    double image_container_height=phone_height*0.113;
    return Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .08,
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context)
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Choose Party",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Green, 1.0),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body:Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.33,
                  color: Color.fromRGBO(52, 199, 89, 1.0),
                ),
              ],
            ),
            FlatButton(
              onPressed: (){
                print('Image clicked');
              },
                          child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 5.0),
                    height: image_container_height,
                    width: image_container_width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                      child: Image.asset('assets/Frame 7.png',height: image_height, width: image_width,),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom:20.0),
                    child: 
                    
                    Text(
                      //Add name of variable
                      'Name of our Company',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                         )
                      ),
                  )
                ],
              ),
            ),
            Expanded(
                          child: Container(
                            width: phone_width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0)
                    )
                  ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Column(
                          children: names.map((name) => PartyNAme(
                              name:name,
                              pass: (){
                                Navigator.pushNamed(context, '/purchase2', arguments: {
                                  'name': name,
                                } );
                              }

                          )).toList(),
                        ),
                    ],
                  ),
                  ),
              ),
            ),
          ],
        ) );
  }
}

