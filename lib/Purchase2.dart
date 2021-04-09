import 'dart:ffi';

import 'package:asaanrozgar/Add_Item.dart';
import 'package:flutter/material.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';

// void main() => runApp(MaterialApp(home: Purchase2()));

class Purchase2 extends StatefulWidget {
  @override
  _Purchase2State createState() => _Purchase2State();
}

class _Purchase2State extends State<Purchase2> {
  // data for items added

  List<addItem> objects=[
    addItem(itemName:'Lays', price:10 , quantity:20, image:'Image1'),
    addItem(itemName:'Cheetos', price:30 , quantity:2, image:'Image2'),
  ];

  List<String> itemName = ['Lays', 'Cheetos'];
  List<int> price = [10, 30];
  List<int> quantity = [20, 2];
  List<String> image = ['Image1', 'Image2'];

  Map data = {};
  String name;
  bool toGive = false;
  int invoiceNo = 8;
//  TextEditingController ProductName = new TextEditingController();
  double receivable;
  double payable;
  String Balance_message = '';
  double balance;
  List<Map<String, dynamic>> temp;

  getData() async {
    List<Map<String, dynamic>> temp2 = await DBprovider.db.getData(name);
    setState(() {
      temp = temp2;
      print('data is');
      print(temp);
      temp.forEach((user) {
        payable = user['Payable'];
        receivable = user['Receivable'];
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
      name = data['name'];
    });

    print(balance);
    print(Balance_message);

    return Scaffold(
        backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Payment Details",
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.55,
                  color: Color.fromRGBO(52, 199, 89, 1.0),
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
                    Text(data['name'],
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
                          color: Color.fromRGBO(107, 143, 165, 1.0),
                        )),
                    Text("Rs. $balance",
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
                                  ? Text(Balance_message,
                                      style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(245, 70, 93, 1.0),
                                      ))
                                  : Text(Balance_message,
                                      style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12.0,
                                        color:
                                            Color.fromRGBO(46, 189, 133, 1.0),
                                      )),
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
            Container(
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
                child: Column(children: [
                  SizedBox(height: 25),
                  Row(
                    children: [
                      SizedBox(width: 15),
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
                            color: Color.fromRGBO(11, 71, 109, 1.0),
                          )),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                      Text("Date: ",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            color: Color.fromRGBO(107, 143, 165, 0.7),
                          )),
                      Text("16/11/2000 @",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Color.fromRGBO(11, 71, 109, 1.0),
                          )),
                    ],
                  ),
                  Container(
                    child: (itemName == [])
                        ? SizedBox(height: 20)
                        : Column(
                            children: [
                              SizedBox(height: 20),
                              Column(
                                  children:
                                      objects.map((sub) => itemCard(
                                        obj : sub
                                      )
                              ).toList()
                              ),
                            ],
                          ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/purchase3');
                      },
                      height: 30,
                      minWidth: 200,
                      child: Text('ADD ITEMS(OPTIONAL)',
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            color: Color.fromRGBO(11, 71, 109, 1.0),
                          )),
                      color: Color.fromRGBO(136, 182, 211, 0.67)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Total",
                    ),
                  ),
                  TextField(),
                  TextField(),
                  Text("Payment Type"),
                  Text("Cash v"),
                  Row(children: [
                    Column(
                      children: [
                        Text("Balance Due"),
                        Text("Rs.0.00"),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                    FlatButton(
                        onPressed: () {},
                        child: Text('NEXT',
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              color: Color.fromRGBO(11, 71, 109, 1.0),
                            )),
                        color: Color.fromRGBO(136, 182, 211, 0.67)),
                  ]),
                ]),
              ),
            ),
          ],
        )));
  }
}

// Widget input_text_fields(String label, TextEditingController name) {
//   return TextField(
//       controller: name,
//       cursorColor: Colors.lightBlue,
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         enabledBorder: InputBorder.none,
//         errorBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         hintText: '$label',
//         hintStyle: GoogleFonts.lato(
//             textStyle: TextStyle(
//           color: Color.fromRGBO(60, 60, 67, 0.3),
//           fontSize: 14,
//         )),
//       ));
// }

