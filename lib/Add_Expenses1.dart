//Add Expenses page 1
//This page contains the creation of the first step of adding expenses.

import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/PartyNames.dart';
import 'package:provider/provider.dart';
import 'DataBase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';




//The parent class of add expenses 1.
class add_expenses1 extends StatefulWidget {
  @override
  _add_expenses1State createState() => _add_expenses1State();
}

class _add_expenses1State extends State<add_expenses1> {
  //Names of all the parties that the user is in business with.
  List <String> names = [];

  //Gets the list of parties from the database.
  getParty() async{
    var temp2 = await DBprovider.db.getParties();
    setState((){
      names = temp2;
    });
  }

  @override
  //Initializes the party names.
  void initState(){
    super.initState();
    print("hi");
    getParty();

  }
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    int color_Red = 12;
    int color_Green = 109;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double image_height=  phone_height * 0.052;
    double image_width = phone_width *0.149;
    double image_container_width=phone_width*0.219;
    double image_container_height=phone_height*0.113;
    //Creates the skeleton of the page.
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
        //Creates the body of the page.
        body:Column(
          children: [
            //Creates a clickable image of the user's profile.
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
                    child: Text(
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
            //Creates the data part of the page.
            Expanded(
              //Creates a list of names for all the parties as a button.
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

