import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import './Widgets/iconButton.dart';
import './Widgets/std_chinbar.dart';
import './Widgets/FAB.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/DataBase.dart';


class ReportsMenu extends StatelessWidget {
  final List<ChildButton> buttons = [ChildButton(label: 'sale', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/sale'),
                                      ChildButton(label: 'purchase', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/purchase')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: std_appbar(context, "Reports", 11, 71, 109),
      backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
      floatingActionButton: std_FAB(Colors.white, 11, 71, 109, buttons, context),
      bottomNavigationBar: std_chinbar(context, 0,0,0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body:
       Container(
       height: MediaQuery.of(context).size.height * 0.85,
       width: MediaQuery.of(context).size.width,
       // margin: EdgeInsets.only(top: 200),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.only(
         topLeft: Radius.circular(26),
         topRight: Radius.circular(26),
       ),
       ),
       child:  
       
       Column(
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 22.0),
             child: Text("Please Select Report you want to see from\nfollowing option.",
             style: TextStyle(
                              color: Color.fromRGBO(11, 71, 109, 1),
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                               )
             ),
           ),
           Center(
              child: Wrap(
               spacing: 20,
               runSpacing: 20,
               children: [
               iconButton('Income\nStatement', './assets/income.png', context, '/income_stmnt'),
               iconButton('Tax\nReport', './assets/tax.png', context ,''),
               iconButton('Balance\nStatement', './assets/balance.png',context,''),
               iconButton('Inventory\nReport', './assets/inventory.png',context,''),
               iconButton('Cash Flow\nStatement', './assets/money.png',context,'/cashflow_report'),
           ],
            ),
      ),
         ],
       ),

      ),
     
    
    );
  }
}

