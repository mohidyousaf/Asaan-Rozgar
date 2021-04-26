import 'dart:ffi';

// import 'package:asaanrozgar/practise.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:flutter/material.dart';
import 'Widgets/std_appbar.dart';
import 'Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'DataBase.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/itemCard.dart';

// void main() => runApp(MaterialApp(home: PaymentDetail()));

class PaymentDetail extends StatefulWidget {

  @override
  _PaymentDetailState createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
List<ChildButton> buttons = [ChildButton(label: 'Add Party', icon: Icon(Icons.person, color: Colors.white,), route: '/addParty')];
  double balance = 0;
  bool toGive = false;
  String name = "";
  String date = '';
  String partyName = "";
  int invoiceNo = 8;
  double payable = 0.0;
  var data;
  var type;
  var _value = 'Cash';
  List<addItem> orderList = [];
  List<String> accounts = [];
  getData() async{
    var temp2 = await DBprovider.db.getAccounts();
    var temp = await DBprovider.db.getOrderDetails(id:name);
    setState((){
      accounts = temp2;
      type = temp['type'];
      payable = temp['payable'];
      partyName = temp['partyName'];
      balance = temp['balance'];
      orderList = temp['orderList'];
      date = temp['date'];
    });
  }
  TextEditingController priceController = new TextEditingController();
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
    return Scaffold(
        backgroundColor: Color.fromRGBO(109, 11, 93, 1.0),
        appBar: std_appbar(context, 'Order No. $name', 109, 11, 93),
        floatingActionButton:
        std_FAB(Colors.white, 109, 11, 93, buttons, context),
        bottomNavigationBar: std_chinbar(context, 0,0,0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        body: Column(
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
                    Text(partyName,
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
                                  ? Text("You'll Give",
                                      style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(245, 70, 93, 1.0),
                                      ))
                                  : Text("You'll Get",
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
           // SingleChildScrollView(
                 Expanded(
                   child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    )),
              child: SingleChildScrollView(
                              child: Column(children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 20),
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
                              fontWeight: FontWeight.normal,
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
                        Text(date.toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                              color: Color.fromRGBO(11, 71, 109, 1.0),
                            )),
                      ],
                    ),
                      Container(
                        child: (orderList.length == 0)
                            ? SizedBox(height: 20)
                            : Column(
                          children: [
                            SizedBox(height: 20),
                            Container(
                              height: (orderList.length > 2)? 160.0 :((orderList.length)*80.0),
                              child: SingleChildScrollView(
                                child: Column(
                                    children: orderList
                                        .map((sub) => itemCard(obj: sub))
                                        .toList()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height:10),
                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: TextField(
                         controller: priceController,
                        decoration: InputDecoration(
                            labelText: "Recieved",
                            prefixText: "Rs.",
                        )
                    ),
                     ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          padding: EdgeInsets.only(left:10),
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
                    // Last Button And columns
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:[ 
                         Column(
                           children: [
                             Text("Balance Due",
                             style: TextStyle(
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(11, 71, 109, 1.0),
                                  )
                             ),
                             SizedBox(height:8),
                             Text("Rs.$payable",
                             style: TextStyle(
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                      color: Color.fromRGBO(11, 71, 109, 1.0),
                                  )
                             ),
                           ],
                        ),
                        FlatButton(
                        onPressed: () async{
                            await DBprovider.db.updateOrder(
                                partyName,
                                type,
                                name,
                                priceController.text.toString(),
                                payable.toString(),
                                _value);
                            Future.delayed(Duration(milliseconds: 50)).then((_)=>
                                Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false));
                        },
                        height: 40,
                        minWidth: 90,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('NEXT',
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                                color: Colors.white
                            )),
                        color: Color.fromRGBO(109, 11, 93, 1.0))
                       ]
                      ),
                    )
                ]
                ),
              ),
            ),
                )
           // ),
          ],
        )
        );
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