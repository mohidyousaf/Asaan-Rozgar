//Parties page.
//This page creates the the screen for a particular/single party.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:asaanrozgar/DataBase.dart';
import 'package:asaanrozgar/dashboard.dart';
import 'package:asaanrozgar/home.dart';
import 'Widgets/std_appbar.dart';
import 'Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/filter_info.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/drawer.dart';

// void main() => runApp(MaterialApp(
//   home: Parties(),
// ));

//Parent class for parties.
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
    double width = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeModel(type:'party', name:name),),
        ChangeNotifierProvider(create: (context) => PartyModel(partyName: name),),
      ],
      //Creates the skeleton of the page.
      child: Scaffold(
          backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
          endDrawer: drawer(),
          appBar: std_appbar(context, name, 109, 11, 93),
          floatingActionButton: std_FAB(Colors.white, 109, 11, 93, buttons, context),
          bottomNavigationBar: std_chinbar(context, 0, 0, 0),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          //Creates the body of the page.
          body: Column(
          children:[

            Dashboard(),
            SizedBox(height:3),
            //Creates the data section of the page.
           Expanded(
             child: Container(
              width: MediaQuery.of(context).size.width,
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
                            //Creates the filter and report buttons on the top.
                           filter_info(context,name),
                            SizedBox(height:10),
                            Consumer<PartyModel>(
                                builder: (context, party, child){
                                //Creates the list of orders with that party.
                                return Expanded(
                                  child: SizedBox(
                                    child: SingleChildScrollView(
                                      child: Column(
                                          children: party.orderList.map<Widget>((item) => ListItem(route:'/order',name:item.name, amount:item.amount, date: item.date,order: item.type,)).toList()
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
class Order{
  var name;
  var amount;
  var date;
  var type;
  bool display = true;
  Order({this.name, this.amount, this.date, this.type});
  setBool(bool newVal) {
    display = newVal;
  }
}

class PartyModel extends ChangeNotifier{
  String partyName;
  List<Order> orders = [];
  List<Order> get orderList => orders.where((element)=>element.display == true).toList();
  PartyModel({this.partyName}){
    var initFuture = initializeScreen();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  initializeScreen() async{
    orders = await DBprovider.db.getOrderList(partyName);
  }
  searchItems(text){
    print(text);
    text = text.toLowerCase();
    RegExp match = new RegExp('^$text');
    orders.forEach((element) {
      if (!match.hasMatch(element.name.toLowerCase())){
        element.setBool(false);
      }
      else{
        element.setBool(true);
      }
    });
    notifyListeners();
  }
}
