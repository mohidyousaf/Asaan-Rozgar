import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home:MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          // TODO: back routing
          onPressed: ()=>{},
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

        actions: <Widget>[IconButton(
          //TODO: MENU
          onPressed: ()=>{},
        icon: Icon(Icons.menu),
      )
      ],
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
    );
  }
}

//Top rectangle
class Dashboard extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 79,
      width: 375,
      margin: EdgeInsets.all(19.5),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 28,
      ),

      child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(

                // child: Text()
                children: [
                  RichText(
                      text: TextSpan(
                          style:TextStyle(
                            color: Color.fromRGBO(46,189,133,1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                          children: [
                            WidgetSpan(
                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: Icon(Icons.arrow_downward,
                                    color: Color.fromRGBO(46,189,133,1),
                                  ),
                                )
                            ),
                            TextSpan(
                              text: "You will Get",
                            ),


                          ]
                      )

                  ),

                  Text(
                    "Rs. 40,000",
                    style: TextStyle(
                      color: Color.fromRGBO(46,189,133,1),
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                    ),
                  )

                ],
              ),
            ),

            SizedBox(width: 10),
            VerticalDivider(thickness: 1),
            SizedBox(width: 10),

            Expanded(
              flex: 1,
              child: Column(
                // child: Text()
                children: [
                  RichText(
                      text: TextSpan(
                          style:TextStyle(
                            color: Color.fromRGBO(245,70,93,1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                          children: [
                            WidgetSpan(
                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: Icon(Icons.arrow_upward,
                                    color: Color.fromRGBO(245,70,93,1),
                                  ),
                                )
                            ),
                            TextSpan(
                              text: "You will Get",
                            ),


                          ]
                      )

                  ),
                  Text(
                    "Rs. 50,000",
                    style: TextStyle(
                      color: Color.fromRGBO(245,70,93,1),
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                    ),
                  )

                ],
              ),
            )
          ]
      ),

    );
  }
}

// Sale + Expenses + month
class Test extends StatelessWidget {
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
                    onPressed: () {},
                    iconSize: 18,
                  ),

                Text(
                  'March',
                  style: TextStyle(
                        color: Color.fromRGBO(136, 182, 211, 1),
                        fontFamily: "Lato",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                         )
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Color.fromRGBO(136, 182, 211, 1), 
                    onPressed: () {},
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
             currentState == 0 ? Partners() : Transactions(),
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


// Widget: List
class Partners extends StatefulWidget {
  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  @override

  Widget build(BuildContext context) {
    //final items = ['Horse', 'Cow', 'Camel', 'Sheep', 'Goat'];
    // Define Class Partner Here
    return Container(
      child: 
      Column(
        children: [
          Column(
            children: [
              ListTile(
                  title: Text('Mohid',
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
          
          Column(
            children: [
              ListTile(
                  title: Text('Mohid',
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
        ],
      )
    );
  }
}

//Transactions

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Partner {
  String name;
  double netAmount;
  Partner({this.name, this.netAmount});
}