//import 'package:asaanrozgar/Widgets/searchbar.dart';
import 'package:asaanrozgar/Widgets/action_sheet.dart';
import 'package:asaanrozgar/Widgets/filter_reports.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:asaanrozgar/Widgets/table_head.dart';
import 'package:asaanrozgar/Widgets/table.dart';
import 'package:asaanrozgar/DataBase.dart';
import 'package:provider/provider.dart';

class transactions extends StatefulWidget {
  @override
  _transactionsState createState() => _transactionsState();
}

class _transactionsState extends State<transactions> {
  int currentState;
  @override
  void initState(){
    super.initState();
    currentState=0;
  }
  @override
  Widget build(BuildContext context) {
    int color_Red = 11;
    int color_Green = 71;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double slider_width=phone_width*0.9;
    double slider_height=phone_height*0.0417;
    return ChangeNotifierProvider(
      create: (context) => TransactionModel(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
        appBar: std_appbar(context, 'Transactions', color_Red, color_Green, color_Blue),
        bottomNavigationBar: std_chinbar(context, color_Red, color_Green, color_Blue),
        floatingActionButton:  FloatingActionButton(
            backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
            onPressed: (){},
            child: Icon(Icons.add,color: Colors.white),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0,0),
                    child: Consumer<TransactionModel>(
                        builder:(context, transaction, child){
                          return TextField(
                            onChanged: (text){
                              transaction.searchItems(currentState, text);
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.fromLTRB(20,3,20,3),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Search',
                              hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(16.0),)
                              ),
                            ),
                          );
                        })
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  //height: 250,
                  width: phone_width,
                  //color: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
                  child: Align(
                    alignment: Alignment.center,
                                    child: Container(
                                      height: slider_height,
                                      width: slider_width,
                                      child: CupertinoSlidingSegmentedControl(
                       groupValue: currentState,
                       //backgroundColor: Color.fromRGBO(118, 118, 128, 1.0),
                       backgroundColor: Colors.grey[100],
                       children: <int, Widget>{
                         0: Text('Sale',
                             style: TextStyle(
                                // color: Color.fromRGBO(11, 71, 109, 1.0),
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,

                               )
                            ),
                         1: Text('Expenses',
                             style: TextStyle(
                               //color: Color.fromRGBO(11, 71, 109, 1.0),
                               color: Colors.black,
                               fontFamily: "Lato",
                               fontWeight: FontWeight.bold,
                               fontSize: 14,
                             )
                           ),
                           2: Text('Purchase',
                             style: TextStyle(
                               //color: Color.fromRGBO(11, 71, 109, 1.0),
                               color: Colors.black,
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
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0)
                    )
                  ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          report_model(currentState),
                          Consumer<TransactionModel>(builder: (context, transactions, child) {
                            return Stack(
                                children: <Widget>[
                                  currentState == 0 ?
                                  Column(
                                    children: [
                                      sale_purchase_head(context),
                                      SizedBox(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.8,
                                          child: sale_purchase_lis(
                                              items: transactions.getSales)
                                      )
                                    ],
                                  ) : Text(''),
                                  currentState == 1 ?
                                  Column(
                                    children: [
                                      expenses_head(context),
                                      SizedBox(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.8,
                                          child: expenses_lis(
                                              items: transactions.getExpenses)
                                      )
                                    ],
                                  ) : Text(''),
                                  currentState == 2 ?
                                  Column(
                                    children: [
                                      sale_purchase_head(context),
                                      SizedBox(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.8,
                                          child: sale_purchase_lis(
                                              items: transactions.getPurchases)
                                      )
                                    ],
                                  ) : Text('')
                                ]
                            );
                          }),
                        ],
                        ),
                    )
                  )
                  )

              ],
              ),

      ),
    );
  }
}
class SalePurchaseItem{
  var date;
  var name;
  var quantity;
  var price;
  var partyName;
  var tag;
  var type;
  bool display = true;
  SalePurchaseItem({this.date, this.name, this.quantity, this.price, this.partyName, this.type, this.tag});
  setBool(val){
    display = val;
  }
}
class ExpenseItem{
  var date;
  var type;
  var price;
  bool display = true;
  ExpenseItem({this.date, this.type, this.price});
  setBool(val){
    display = val;
  }
}

class TransactionModel extends ChangeNotifier{
  List<SalePurchaseItem> items = [];
  List<ExpenseItem> expenseItems = [];


  get getSales => items.where((element) => element.display == true && element.type == 'sale').toList();
  get getPurchases => items.where((element) => element.display == true && element.type == 'purchase').toList();
  get getExpenses => expenseItems.where((element) => element.display == true).toList();
  TransactionModel(){
    var initFuture = initializeCart();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  getCategories(type){
    Set<String> categories = Set();
    if (type == 'sale'){
      items.forEach((element){
        element.type == 'sale'?categories.add(element.tag):1;
      });
    }
    else if (type == 'purchase'){
      items.forEach((element){
        element.type == 'purchase'?categories.add(element.tag):1;
      });
    }
    return categories;
  }
  initializeCart() async{
    items = await DBprovider.db.getSalePurchaseList();
    expenseItems = await DBprovider.db.getExpensesList();
  }
  reset() {
    items.forEach((element) {
      element.setBool(true);
    });
    expenseItems.forEach((element) {
      element.setBool(true);
    });
    notifyListeners();
  }
  filterItems({searchText, types, categoryVal, priceVals, quantityVals}) async {
    if (types.contains(1)) {
      searchText = searchText.toLowerCase();
      items.forEach((element) {
        if (element.partyName.toLowerCase() != searchText) {
          element.setBool(false);
        }
        else {
          element.setBool(true);
        }
      });
    }
    else if (types.contains(2)){
      categoryVal = categoryVal.toLowerCase();
      items.forEach((element) {
        if (element.tag.toLowerCase() != categoryVal) {
          element.setBool(false);
        }
        else {
          element.setBool(true);
        }
      });
    }
    notifyListeners();
  }
  searchItems(type, text) async{
    print(text);
    text = text.toLowerCase();
    RegExp match = new RegExp('^$text');
    if (type == 0 || type == 2){
      items.forEach((element) {
        if (!match.hasMatch(element.name.toLowerCase())){
          element.setBool(false);
        }
        else{
          element.setBool(true);
        }
      });
    }
    else{
      expenseItems.forEach((element) {
        if (!match.hasMatch(element.type.toLowerCase())){
          element.setBool(false);
        }
        else{
          element.setBool(true);
        }
      });
    }

    print('after $items');
    notifyListeners();
  }
}

class report_model extends StatelessWidget {
  report_model(this.value);
  var value;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TransactionModel>(context, listen: false);
    return value == 0 || value == 2 ? filter_reports(type: 'salePurchase',filterModel: model):
              value == 1 ? filter_reports(type: 'expense',filterModel: model):'';
  }
}
