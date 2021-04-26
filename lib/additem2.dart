import 'dart:ffi';

import 'package:asaanrozgar/Add_Item.dart';
import 'package:flutter/material.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';

// void main() => runApp(MaterialApp(home: Purchase2()));

class additem2 extends StatefulWidget {
  @override
  _additem2State createState() => _additem2State();
}

class _additem2State extends State<additem2> {
  // data for items added

  // List<addItem> objects = [
  //   addItem(itemName: 'Lays', price: 10, quantity: 20, image: 'Image1'),
  //   addItem(itemName: 'Cheetos', price: 30, quantity: 2, image: 'Image2'),
  // ];
  //List<addItem> objects = [];


  Map data = {};
  List<String> accounts = [];
  List<addItem> objects = [];
  String name;
  bool toGive = false;
  int invoiceNo = 8;
  String _value = 'Cash';
  double total = 0;
//  TextEditingController ProductName = new TextEditingController();
  double receivable;
  double payable;
  String Balance_message;
  double balance;
  var temp;
  TextEditingController amountReceived = new TextEditingController();
  double get totalPrice => objects.fold(0, (total, item) => total + (item.quantity*item.price));

  getData() async {
    var temp2 = await DBprovider.db.getData(name);
    var temp3 = await DBprovider.db.getAccounts();
    setState(() {
      temp = temp2;
      accounts = temp3;
      print('data is');
      print(temp);
      payable = temp['Payable'];
      receivable = temp['Receivable'];
      if (payable > receivable) {
        balance = payable - receivable;
        Balance_message = "You'll Pay";
        toGive = true;
      } else {
        balance = receivable - payable;
        Balance_message = "You'll Get";
        toGive = false;
      }
      print('-----------');
    });
  }

  @override
  void initState() {
    super.initState();
    print("init");
    // future that allows us to access context. function is called inside the future
    // otherwise it would be skipped and args would return null
    Future.delayed(Duration.zero, () {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    setState(() {
      name = data['partyName'];
      objects = data['obj'];
    });

    print(balance);
    print(Balance_message);

    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
        appBar: std_appbar(context, 'Payment Details', 255, 159, 10),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.55,
                  color: Colors.blue[500],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text(name == null ? '' : name,
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Balance",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Colors.white
                        )),
                    Text("Rs. ${balance == null ? '0':balance}",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w800,
                          fontSize: 28.0,
                          color: Colors.white,
                        )),
                    Row(
                      children: [
                        SizedBox(width: 45),
                        Column(
                          children: [
                            Container(
                              child: (toGive == true)
                                  ? Row(
                                    children: [
                                      Text(Balance_message,
                                          style: TextStyle(
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w800,
                                            fontSize: 12.0,
                                            color: Color.fromRGBO(245, 70, 93, 1.0),
                                          )),
                                          Icon(Icons.arrow_upward,
                                          size: 14,
                                          color: Color.fromRGBO(245, 70, 93, 1.0))
                                    ],
                                  )
                                  : Row(
                                    children: [
                                      Text(Balance_message == null ? '': Balance_message,
                                          style: TextStyle(
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w800,
                                            fontSize: 12.0,
                                            color:
                                                Color.fromRGBO(46, 189,133, 1.0),
                                          )),
                                          Icon(Icons.arrow_downward,
                                          size: 14,
                                          color: Color.fromRGBO(46,189, 133, 1.0),),
                                    ],
                                  ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
                          child: Container(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    )),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: SingleChildScrollView(
                                    child: Column(children: [
                      SizedBox(height: 25),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("Invoice No:  ",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                                color: Color.fromRGBO(107, 143, 165, 0.7),
                              )),
                          Text("$invoiceNo",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromRGBO(255, 159, 10, 1.0),
                              )),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.36),
                          Text("Date: ",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                                color: Color.fromRGBO(107, 143, 165, 0.7),
                              )),
                          Row(
                            children: [
                              Text("16/11/2000",
                                  style: TextStyle(
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    color: Color.fromRGBO(255, 159, 10, 1.0),
                                  )),
                                  SizedBox(width: 3,),
                                  Icon(Icons.calendar_today_rounded,
                                  color: Color.fromRGBO(255, 159, 10, 1.0),
                                  size: 15,)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            height: (objects.length > 3)? 150.0 :((objects.length)*50.0),
                            child: SingleChildScrollView(
                              child: Column(
                                  children: objects
                                      .map((sub) => itemCard(obj: sub))
                                      .toList()),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: 20,
                          ),
                          Text("Paid:",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.black54,
                              )),
                          Row(
                            children: [
                              Text("Rs.",
                                  style: TextStyle(
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  controller:amountReceived,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Payment Type",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.black54,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Container(
                                    child: DropdownButton(
                                        value: _value,
                                        items: accounts.map((String dropDownStringItem){
                                          return DropdownMenuItem<String>(
                                            value: dropDownStringItem,
                                            child: Text(dropDownStringItem),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                          });
                                        })
                                  ),
                                ],
                              ),
                        ],
                      ),
                      SizedBox(height: 17,),
                       Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text("Sub Total:",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                )),
                              SizedBox(height: 5,),
                              Text("Rs. ${totalPrice == null ? '0': totalPrice}",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                )),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                      Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                          onPressed: () async{
                            var temp = await DBprovider.db.addItems(
                                _value,
                                data['obj'],
                                data['partyName'],
                                data['tag'],
                                data['salePrice'],
                                data['taxRate'],
                                data['minStock'],
                                totalPrice.toString(),
                                amountReceived.text.toString())
                            ;
                            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                            print(temp);
                          },
                          height: 30,
                          minWidth: 90,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                          child: Text('SAVE',
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 10.0,
                                color: Colors.white
                              )),
                          color: Color.fromRGBO(255, 159, 10, 1.0)),
                          SizedBox(width: 50,),
                    ],
                )
                    ],
                ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
