import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:asaanrozgar/dashboard.dart';
import 'package:asaanrozgar/home.dart';
import 'Widgets/std_appbar.dart';
import 'Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/filter_info.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MaterialApp(
//   home: Parties(),
// ));

class Parties extends StatefulWidget{
  @override
  _PartiesState createState() => _PartiesState();
}

class _PartiesState extends State<Parties> {
  var name = "";
  var data;
  List<ChildButton> buttons = [ChildButton(label: 'Add Party', icon: Icon(Icons.person, color: Colors.white,), route: '/addParty')];

  @override
  Widget build(BuildContext context){
    data = ModalRoute.of(context).settings.arguments;
    setState((){
      name = data['name'];
    });
    // double width = MediaQuery.of(context).size.width;
    return
    ChangeNotifierProvider(
      create: (context) => HomeModel(type:'party', name:name),
      child: Scaffold(
          backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),

          //Updated FAB
          appBar: std_appbar(context, name, 109, 11, 93),
          floatingActionButton: std_FAB(Colors.white, 109, 11, 93, buttons, context),
          bottomNavigationBar: std_chinbar(context, 0, 0, 0),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          body: Column(
          children:[

            Dashboard(),
            SizedBox(height:3),
           Expanded(
             child: Container(
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
                filter_info(context),
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
           ),
       ]
          )
          ),
    );
  }
}