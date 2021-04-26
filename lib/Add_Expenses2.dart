import 'dart:ffi';

import 'package:asaanrozgar/Widgets/validationFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widgets/std_appbar.dart';
import 'Widgets/std_chinbar.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import './Widgets/textfield.dart';


void main() => runApp(MaterialApp(home: add_expenses2()));



class add_expenses2 extends StatefulWidget {
  
  @override
  _add_expenses2State createState() => _add_expenses2State();
}

class _add_expenses2State extends State<add_expenses2> {
  List<ChildButton> buttons = [];
  int invoiceNo = 8;
  var accounts;

  TextEditingController typeController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();
  TextEditingController detailsController = new TextEditingController();
  var accountName = 'Cash';
  double balance = 0;
  var account;
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValid = AutovalidateMode.disabled;
  accountType(value){
    setState(() {
      account = value;
      accountName = account['name'];
      balance = account['balance'];
    });
    print(balance);
  }
  getData() async{
    var temp3 = await DBprovider.db.getAccountBalances();
    setState(() {
      accounts = temp3;
      accounts.forEach((element){
        if (element['name'] == 'Cash'){
          account = element;
        }
      });
      accountName = account['name'];
      balance = account['balance'];
    });
  }
  @override
  void initState() {
    super.initState();
    // future that allows us to access context. function is called inside the future
    // otherwise it would be skipped and args would return null
    Future.delayed(Duration.zero, () {
      getData();
    });
  }
  @override
  Widget build(BuildContext context) {
    int color_Red = 12;
    int color_Green = 109;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
        appBar: std_appbar(context, 'Expense Details', color_Red, color_Green, color_Blue),
        floatingActionButton:
        std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
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
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
           // SingleChildScrollView(
                 Expanded(
                   child: Container(
                          //height: MediaQuery.of(context).size.height * .6531,
                          //height: 493,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  topRight: Radius.circular(26),
                    )),
                        child: Form(
                            key: _formKey,
                            autovalidateMode: autoValid,
                            child: SingleChildScrollView(
                                child: Column(children: [
                                      SizedBox(height: 25),
                                      Row(
                                        children: [
                                          //SizedBox(width: 20),
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.7),
                                          Container(
                                            child: Row(children: [
                                              Text("Date: ",
                                              style: TextStyle(
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12.0,
                                                color: Color.fromRGBO(107, 143, 165, 0.7),
                                              )),
                                              Text("26/04/2021",
                                              style: TextStyle(
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12.0,
                                                color: Color.fromRGBO(11, 71, 109, 1.0),
                                              )),
                                            ],)
                                          )
                                        ],
                                      ),
                                    SizedBox(height:MediaQuery.of(context).size.height * 0.02),
                                         Container(
                                           alignment: AlignmentDirectional.topStart,
                                           padding: EdgeInsets.only(left: 16.0),
                                         child: InputTextFields(label: 'Type',controller: typeController, validateFunc: ValidationFunctions.validateEmpty,),
                                ),
                                    SizedBox(height: 10.0),
                                    Container(

                                        alignment: AlignmentDirectional.topStart,
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: InputTextFields(label: 'Amount',controller: amountController, validateFunc:ValidationFunctions.validateAmount,arg: balance.toInt(),),
                                      ),
                                 SizedBox(height: 10.0),
                                 Container(
                                      alignment: AlignmentDirectional.topStart,
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: InputTextFields(label: 'Details',controller: detailsController,validateFunc: ValidationFunctions.none,)
                                 ),

                                  SizedBox(height: 10.0),
                                      Padding(
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                                child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  DropdownButtonFormField(
                                                    decoration: InputDecoration(
                                                      labelText: 'Payment Type',
                                                    ),
                                                    value: account,
                                                    items: accounts == null?[]:accounts.map<DropdownMenuItem>((var dropDownStringItem){
                                                      return DropdownMenuItem(
                                                        value: dropDownStringItem,
                                                        child: Text(dropDownStringItem['name']),
                                                      );
                                                    }).toList(),
                                                    onChanged: (value) {
                                                      accountType(value);
                                                    })
                                                ],
                                              ),
                                            ),
                                          ),
                      // Last Button And columns
                                  Container(
                                    padding: EdgeInsets.fromLTRB(120, 100, 120, 50),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor: Colors.grey[900],
                                      color: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
                                      elevation: 7.0,
                                      child: TextButton(
                                        onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          var temp = await DBprovider.db
                                              .addExpense(
                                            accountName,
                                            typeController.text.toString(),
                                            amountController.text.toString(),
                                            detailsController.text.toString(),
                                          );
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                              '/home', (
                                              Route<dynamic> route) => false);
                                         }
                                        else{
                                          setState((){
                                            autoValid = AutovalidateMode.always;
                                          });
                                        }
                                        },
                                        child: Center(
                                          child: Text(
                                            'Add Expense',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                  ]
                  ),
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