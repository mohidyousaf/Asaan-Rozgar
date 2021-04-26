import 'package:asaanrozgar/DataBase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:asaanrozgar/dashboard.dart';
import 'package:asaanrozgar/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() => runApp(MaterialApp(
//   home:MyApp(),
// ));

class MyApp extends StatelessWidget {
  final List<ChildButton> buttons = [ChildButton(label: 'sale', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/sale'),
                                      ChildButton(label: 'purchase', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/purchase')];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(type:'home'),
      child: Scaffold(
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
      body: Column(children: [
        Dashboard(),
        Test(),
        Expanded(
          child: Container(
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
        ),
      ],
      ),
        floatingActionButton:
        std_FAB(Colors.white, 11, 71, 109, buttons, context),
        bottomNavigationBar: std_chinbar(context, 0,0,0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ),
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
  List<String> monthList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep','Oct', 'Nov', 'Dec'];
  String curr = 'Jan';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curr = monthList[DateTime.now().month - 1];
  }
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
                  width: 40,
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
                  "- %",
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

              Consumer<HomeModel>(
                builder: (context, home, child){
                  return Text('Rs. ${home.sales ==  null ?
                  '0': home.sales(curr).ceil().toString()}'
                    ,
                    style: TextStyle(
                      color: Color.fromRGBO(136, 182, 211, 1),
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: home.sales(curr).ceil() == null ? 20.0 :home.sales(curr).ceil() > 9999999 ? 16.0 :home.sales(curr).ceil() > 99999 ? 18 : 20.0,
                    ),
                  );
                },)

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

             Consumer<HomeModel>(
               builder: (context, home, child){

                   return Text('Rs. ${home.expenses ==  null ?
                   '0': home.expenses(curr).ceil().toString()}'
                   ,
                   style: TextStyle(
                       color: Color.fromRGBO(136, 182, 211, 1),
                       fontFamily: "Lato",
                       fontWeight: FontWeight.bold,
                       fontSize: home.expenses(curr).ceil() == null ? 20.0 :home.expenses(curr).ceil() > 9999999 ? 16.0 :home.expenses(curr).ceil() > 99999 ? 18 : 20.0,
                   ),
                   );
             },)

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

  @override
  void initState(){
    super.initState();
  }
  // List<Map<String, String>> partnerList = [{'name':'Adil Aslam','amount':'3000'},{'name':'Mohid Yousaf','amount':'5000'}];

  Widget segmentControl()
  {
    return Container(
      // width: 200,
      // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,MediaQuery.of(context).size.width*0.001,MediaQuery.of(context).size.width*0.1,MediaQuery.of(context).size.height*0.6),
      // padding: EdgeInsets.all(8.0),
      child: Column(
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
             // Transactions(list:transactionList)
             Consumer<HomeModel>(builder: (context, model, child){
               return currentState == 0 ? Partners(list:model.partners) : Transactions(list:model.transactions);
             },)

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

class Partners extends StatefulWidget {
  Partners({this.list});
  final List<Map<String, String>> list;
  final _key = GlobalKey<AnimatedListState>();
  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  var model;

  Func(context, index){
    widget._key.currentState.removeItem(
        index, (context, animation) => ListItem(
                        index:index,
                        animation: animation),
        duration: const Duration(milliseconds: 300));
    Future.delayed(Duration(milliseconds: 250)).then((value) => model.removeItem(index));
  }
  @override
  Widget build(BuildContext context) {
    model = Provider.of<HomeModel>(context, listen: false);
    //This contans a list of items that are both tappable and slidable.
    return Flexible(
        child:AnimatedList(
      key: widget._key,
      initialItemCount: widget.list.length,
      itemBuilder: (context, index, animation) {
        var item = widget.list[index];
        return ListItem(
            func: Func,
            index:index,
            animation: animation,
            route: '/party',
            name:item['name'],
            amount:item['amount'],
            ); // Refer step 3
      },
    )
    );

  }
}

class Transactions extends StatefulWidget {
  Transactions({this.list});
  final List<Map<String, String>> list;
  final _key = GlobalKey<AnimatedListState>();
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  var model;
  @override
  Widget build(BuildContext context) {
    model = Provider.of<HomeModel>(context, listen: false);
    //This contans a list of items that are both tappable and slidable.
    return Flexible(
      child: AnimatedList(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        key: widget._key,
        initialItemCount: widget.list.length,
        itemBuilder: (context, index, animation) {
          var item = widget.list[index];
          return ListItem(
            index:index,
            animation: animation,
            route: '/order',
            name:item['orderID'],
            amount:item['amount'],
            date:item['date'],
            type: item['type'],);
        },
      ),
    );

  }
}

class ListItem extends StatelessWidget {

  const ListItem({this.func, this.model, this.animation, this.index, this.type, this.name, this.amount, this.date, this.route, this.order});
  final name;
  final amount;
  final date;
  final route;
  final order;
  final type;
  final animation;
  final index;
  final model;
  final func;
  @override
  Widget build(BuildContext context) {
    return  order == null? SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child:Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: type == null && order == null? <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async{
            await myAlert(context, func, index);
          },
        ),
      ]:[],
      child: TextButton(
        onPressed: ()=> type == null ? {
          Navigator.pushNamed(context, route, arguments:
          {'name': name})
        }: null,
        child: Column(
            children: [
                ListTile(
                  title: Text(name == null ? '':order == null ?
                              type == null ? name: '${type}':'Order No. $name',
                  style:TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,
                      color: Color.fromRGBO(38, 51, 58, 1.0),
                      ),
                  ),
                  subtitle: Text(date == null ? '':date),
                  trailing:
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                          Text(amount == null ? '':amount,
                          style:TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: type != null ?
                                          type == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):
                                              Colors.red[500]:
                                            order != null ?
                                            order == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):Colors.red[500]:
                                            Color.fromRGBO(46, 189, 133, 1.0),//parties
                              ),
                          ),
                          Text(type == null?
                                      order != null ?
                                          order == 'sale'?'To Get':'To Give':
                                          'You will Give'://party
                                type == 'sale'?'Received':
                                type == 'purchase'? 'Paid':
                                type == 'expense'? 'Paid':
                                type == 'asset' ? 'Paid':'',
                          style:TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: type != null ?
                                      type == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):
                                      Colors.red[500]:
                                      order != null ?
                                      order == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):Colors.red[500]:
                                      Color.fromRGBO(46, 189, 133, 1.0),//parties
                              ),
                          ),
                      ],
                      ),

                ),
                Divider(height: 1, thickness: 0.5, endIndent: 15,),
                ],
        ),
      ),
    )
    ):Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: type == null && order == null? <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async{
            await myAlert(context, func, index);
          },
        ),
      ]:[],
      child: TextButton(
        onPressed: ()=> type == null ? {
          Navigator.pushNamed(context, route, arguments:
          {'name': name})
        }: null,
        child: Column(
          children: [
            ListTile(
              title: Text(name == null ? '':order == null ?
              type == null ? name: '${type}':'Order No. $name',
                style:TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 17.0,
                  color: Color.fromRGBO(38, 51, 58, 1.0),
                ),
              ),
              subtitle: Text(date == null ? '':date),
              trailing:
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(amount == null ? '':amount,
                    style:TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: type != null ?
                      type == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):
                      Colors.red[500]:
                      order != null ?
                      order == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):Colors.red[500]:
                      Color.fromRGBO(46, 189, 133, 1.0),//parties
                    ),
                  ),
                  Text(type == null?
                  order != null ?
                  order == 'sale'?'To Get':'To Give':
                  'You will Give'://party
                  type == 'sale'?'Received':
                  type == 'purchase'? 'Paid':
                  type == 'expense'? 'Paid':
                  type == 'asset' ? 'Paid':'',
                    style:TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: type != null ?
                      type == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):
                      Colors.red[500]:
                      order != null ?
                      order == 'sale'?Color.fromRGBO(46, 189, 133, 1.0):Colors.red[500]:
                      Color.fromRGBO(46, 189, 133, 1.0),//parties
                    ),
                  ),
                ],
              ),

            ),
            Divider(height: 1, thickness: 0.5, endIndent: 15,),
          ],
        ),
      ),
    );
  }
}

class HomeModel extends ChangeNotifier{
  List<Map<String, String>> partnerList = [];
  List<Map<String, String>> transactionList = [];
  get partners => partnerList;
  get transactions => transactionList;
  var name;
  var type;
  var receivable;
  var payable;
  var saleExpenses;
  get receivables => receivable;
  get payables => payable;
  sales(month) => saleExpenses == null ?
                    0: (saleExpenses[month]==null ?
                    0:saleExpenses[month].sale);
  expenses(month) => saleExpenses == null ?
                      0: (saleExpenses[month]==null ?
                      0:saleExpenses[month].expense);
  HomeModel({this.type, this.name}){
    if (type == 'home'){
      var initFuture = initializeScreen();
      initFuture.then((voidVal){
        notifyListeners();
      });
    }
    else if (type == 'party'){
      var initFuture = initializePartyScreen(name);
      initFuture.then((voidVal){
        notifyListeners();
      });
    }

  }
  removeItem(index)async{
    var query = await DBprovider.db.removeParty(partnerList[index]['name']);
    partnerList.removeAt(index);
    notifyListeners();
  }
  initializeScreen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name= prefs.getString('companyName');
    var details = await DBprovider.db.getCompanyData(name);
    saleExpenses = await DBprovider.db.getTransactions();
    receivable = details['Receivable'];
    payable = details['Payable'];
    var temp = await DBprovider.db.getPartyList();
    var temp2 = await DBprovider.db.getTransactionList();
    partnerList = temp;
    transactionList = temp2;
  }
  initializePartyScreen(name) async{
    var partyDetails = await DBprovider.db.getData(name);
    receivable = partyDetails['Receivable'];
    payable = partyDetails['Payable'];
    notifyListeners();
  }
}

myAlert(BuildContext context, func, index)async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delete, color: Colors.red,size: 50,),
            Text('Delete Party ?', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)))
          ],
        ),
        content: Text('Do you really want to delete Party ?', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey))),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              // true here means you clicked ok
            },
            style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
            ),
            child: Text('Cancel', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.only(right:14.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
              ),
              child:  Text('Delete', style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.white, ),)),
              onPressed: () {
                func(context, index);
                Navigator.of(context).pop(true);
                // true here means you clicked ok
              },
            ),
          ),
        ],
      );
    },
  );
}


