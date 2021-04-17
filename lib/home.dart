import 'package:asaanrozgar/DataBase.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/dashboard.dart';
import 'package:asaanrozgar/drawer.dart';


// void main() => runApp(MaterialApp(
//   home:MyApp(),
// ));

class MyApp extends StatelessWidget {
  final List<ChildButton> buttons = [ChildButton(label: 'sale', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/sale'),
                                      ChildButton(label: 'purchase', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/purchase')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: drawer(),
      backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          // TODO: back routing
          onPressed: ()=>{
          },
        icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Home",
        style:TextStyle(
          fontFamily: "Lato",
          fontWeight: FontWeight.bold,
          fontSize: 24.0,

        )
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),

      //   actions: <Widget>[IconButton(
      //     //TODO: MENU
      //     onPressed: ()=>{
      //       // Navigator.pushNamed(context, '/menu')
      //     },
      //   icon: Icon(Icons.menu),
      // )
      // ],
    ),
    body: SingleChildScrollView(
      child: Column(children: [
        Dashboard(),
        Test(),
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
          child: SegmentControl(),
    ),
    ],
    ),
    ),
      floatingActionButton:
      std_FAB(Colors.white, 11, 71, 109, buttons, context),
      bottomNavigationBar: std_chinbar(context, 0,0,0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

//Top rectangle
// I moved it to a seperate widget file..
//
// Sale + Expenses + month
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String curr = 'Mar';
  List<String> monthList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep','Oct', 'Nov', 'Dec'];

  void changeMonth({type}){
    String month;
    int index = monthList.indexOf(curr);
    if (type == 'inc'){
      if (index >= monthList.length - 1){
        month = monthList[0];
      }
      else{
        month = monthList[ index + 1 ];
      }
    }
    else if (type == 'dec'){
      if (index <= 0){
        month = monthList[monthList.length - 1];
      }
      else{
        month = monthList[ index - 1 ];
      }
    }
    print('hello' + month);
    setState((){
      curr = month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 414,
      padding: EdgeInsets.symmetric(vertical:8.0),
      decoration: BoxDecoration(
      // color: Colors.redAccent,
      ),

      child: Row(

        children: [
          // Element#1

            Container(
              padding: EdgeInsets.only(bottom:30.0),
              child: Row(
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      changeMonth(type: 'dec');
                      },
                    iconSize: 18,
                  ),

                SizedBox(
                  width: 35,
                  child: Center(
                    child: Text(
                      curr,
                      style: TextStyle(
                            color: Color.fromRGBO(136, 182, 211, 1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                             )
                      ),
                  ),
                ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1),
                    onPressed: () {
                      changeMonth(type: 'inc');
                    },
                    iconSize: 18,
                  ),
                ],
                ),
            ),

          //  Padding(
          //     padding: const EdgeInsets.symmetric(
          //       vertical: 0,
          //       horizontal: 0,
          //     ),

          //   ),

          //  Element#2
          Column(
             crossAxisAlignment: CrossAxisAlignment.start ,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 2.0),
                child: Row(children: [
                Text(
                "SALE",
                style: TextStyle(
                        color: Color.fromRGBO(136, 182, 211, 1),
                        fontFamily: "Lato",
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                         ),
            ),
            SizedBox(width:22.0),
            Padding(
                padding: const EdgeInsets.only(left:5.0, right: 5.0),
                child: Text(
                  "+91%",
                  //  textAlign: TextAlign.end,
                   style: TextStyle(
                          color: Color.fromRGBO(136, 182, 211, 1),
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                           ),
                ),
            ),
            ],),
              ),

           Text(
              "Rs. 30000",
              style: TextStyle(
                        color: Color.fromRGBO(136, 182, 211, 1),
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                         ),
            ),

            ]
             ),

          //Element#3
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start ,

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 2.0),
                  child: Row(children: [
                  Text(
                  "EXPENSES",
                  style: TextStyle(
                          color: Color.fromRGBO(136, 182, 211, 1),
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                           ),
              ),
                  ]
                  ),
                ),

             Text(
                "Rs. 30000",
                style: TextStyle(
                          color: Color.fromRGBO(136, 182, 211, 1),
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                           ),
              ),

              ]
               ),
          ),

        ],
      )
    );
  }
}

// toggle partner and transactions
class SegmentControl extends StatefulWidget {
  @override
  _SegmentControlState createState() => _SegmentControlState();
}

class _SegmentControlState extends State<SegmentControl> {
  int currentState = 0;
  List<Map<String, String>> partnerList = [];
  void getList() async{
    var temp = await DBprovider.db.getPartyList();
    setState((){
      partnerList = temp;
    });

  }
  @override
  void initState(){
    super.initState();
    getList();
  }
  // List<Map<String, String>> partnerList = [{'name':'Adil Aslam','amount':'3000'},{'name':'Mohid Yousaf','amount':'5000'}];
  List<Map<String, String>> transactionList = [{'name':'Sale','amount':'30000'},{'name':'Purchase','amount':'5000'}];

  Widget segmentControl()
  {
    return Container(
      width: 200,
      // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,MediaQuery.of(context).size.width*0.001,MediaQuery.of(context).size.width*0.1,MediaQuery.of(context).size.height*0.6),
      // padding: EdgeInsets.all(8.0),
      child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Center(
                child: Container(
                // padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: CupertinoSlidingSegmentedControl(
                   groupValue: currentState,
                   backgroundColor: Color.fromRGBO(118, 118, 128, 0.12),
                   children: <int, Widget>{
                     0: Text('Partners',
                         style: TextStyle(
                            color: Color.fromRGBO(11, 71, 109, 1.0),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,

                           )
                        ),
                     1: Text('Transactions',
                         style: TextStyle(
                           color: Color.fromRGBO(11, 71, 109, 1.0),
                           fontFamily: "Lato",
                           fontWeight: FontWeight.bold,
                           fontSize: 14,
                         )
                       )
                   },
                   onValueChanged: (v){
                     setState(() {
                       currentState = v;
                     });
                   },
               ),
                ),
             ),
             currentState == 0 ? Partners(list:partnerList) : Transactions(list:transactionList),
           ],
         ),
        
      
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:30,left: 10, right: 10),
      child: segmentControl(),
    );
  }
}

class Partners extends StatelessWidget {
  const Partners({this.list});
  final List<Map<String, String>> list;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: list.map((item) => ListItem(name:item['name'], amount:item['amount'])).toList()
    );
  }
}

class Transactions extends StatelessWidget {
  const Transactions({this.list});
  final List<Map<String, String>> list;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: list.map((item) => ListItem(name:item['name'], amount:item['amount'])).toList()
    );
  }
}

class ListItem extends StatelessWidget {

  const ListItem({this.name, this.amount});
  final name;
  final amount;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
            ListTile(
              title: Text(name,
              style:TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 17.0,
                  color: Color.fromRGBO(38, 51, 58, 1.0),
                  ),
              ),
              subtitle: Text(''),
              trailing:
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                      Text(amount,
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
    );
  }
}

class HomeModel extends ChangeNotifier{

  HomeModel(){
    var initFuture = initializeScreen();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  initializeScreen() async{

  }
}

