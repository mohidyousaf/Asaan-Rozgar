import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:asaanrozgar/dashboard.dart';

import 'Widgets/std_appbar.dart';
import 'Widgets/std_chinbar.dart';

// void main() => runApp(MaterialApp(
//   home: Parties(),
// ));

class Parties extends StatelessWidget{
  final name = "Afaq Wholesaler.";
  List<ChildButton> buttons = [ChildButton(label: 'Add Party', icon: Icon(Icons.person), route: '/')];
  @override
  Widget build(BuildContext context){
    // double width = MediaQuery.of(context).size.width;
    return 
    Scaffold(
        backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
        
        //Updated FAB
        floatingActionButton: std_FAB(Colors.black, 109, 11, 93, buttons, context),
        
        // SpeedDial(
        //   child: Icon(Icons.add),
        //   overlayColor: Colors.black,
        //   overlayOpacity: 0.5,
        //   marginRight: MediaQuery.of(context).size.width*0.45,
        //   marginBottom: MediaQuery.of(context).size.width*0.1,
        //   backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
        //   children: [
        //     SpeedDialChild(
        //         child: Icon(Icons.filter_alt_outlined),
        //         label: "Add Party",
        //         backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
        //     )
        //   ],
        // ),

        //Need to Remove
        // FloatingActionButton(
        //   backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
        //   onPressed: (){},
        //   child: Icon(Icons.add, color: Colors.white),
        // ),
        bottomNavigationBar: std_chinbar(context, 0, 0, 0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        body: Column(
        children:[
          std_appbar(context, name, 109, 11, 93),
          Dashboard(),
          SizedBox(height:3),
         Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(top: 200),
          decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.only(
           topLeft: Radius.circular(26),
           topRight: Radius.circular(26),
          ),
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                           child: IconButton(
                        icon: Icon(
                        Icons.filter_alt_outlined,
                        semanticLabel: 'Filter',
                      ),
                        onPressed: (){},
                         ),
                    ),

                        Text(
                     'Filter',
                     style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1.0),
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        
                                       )//GoogleFonts.lato(textStyle:TextStyle(color: Colors.black)),
                   ),

                  ],
                ),
                  
                   IconButton(
                  icon: Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                ),
                  onPressed: (){},
                   ),

              ],
            ),
            SizedBox(height:10),
            Column(
              children: [
                ListTile(
                    title: Text('Order001',
                    style:TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,
                      color: Color.fromRGBO(38, 51, 58, 1.0),
                    ),
                    ),
                    subtitle: Text('13/12/2021',
                    style:TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: Color.fromRGBO(43, 59, 69, 0.7),
                    ),),
                    trailing: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('3000',
                              style:TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromRGBO(46, 189, 133, 1.0),
                              ),
                              ),
                        Text('You will get',
                              style:TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Color.fromRGBO(46, 189, 133, 1.0),
                              ),
                              ),
                      ],
                    ),
                    
                  ),
                  Divider(height: 1, thickness: 0.5, endIndent: 15,),
              ],
            ),  
      ]    
      ),
        ),
      ),
     ]
        )
        );
  }
}