import 'dart:ffi';
import 'package:asaanrozgar/Purchase_invoice.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Add_Item.dart';
import 'package:flutter/material.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:asaanrozgar/itemCard.dart';
import 'package:asaanrozgar/Purchase3.dart';
import 'package:asaanrozgar/Purchase4.dart';


// void main() => runApp(MaterialApp(home: Purchase2()));

//Create Notifier Provider
class PurchaseMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => CartModel(),
    child:PurchaseController());
  }
}

class PurchaseController extends StatefulWidget {
  @override
  _PurchaseControllerState createState() => _PurchaseControllerState();
}

class _PurchaseControllerState extends State<PurchaseController> {
  String curr = 'cart';
  itemList obj;
  changeScreen({screenName, object}){
    setState((){
      curr = screenName;
      obj = object;
    });
  }
  @override
  Widget build(BuildContext context) {
    return (curr == 'catalog') ? Purchase4(func:changeScreen):(curr=='cart' ? Purchase2(func:changeScreen):(curr=='invoice' ? Purchase_invoice(func:changeScreen):Purchase3(func:changeScreen, object:obj))) ;
  }
}

class Purchase2 extends StatefulWidget {
  Purchase2({this.func});
  Function func;
  @override
  _Purchase2State createState() => _Purchase2State();
}

class _Purchase2State extends State<Purchase2> {
  // data for items added

  // List<addItem> objects = [
  //   addItem(itemName: 'Lays', price: 10, quantity: 20, image: 'Image1'),
  //   addItem(itemName: 'Cheetos', price: 30, quantity: 2, image: 'Image2'),
  // ];
  List<addItem> objects = [];

  // List<String> itemName = ['Lays', 'Cheetos'];
  // List<int> price = [10, 30];
  // List<int> quantity = [20, 2];
  // List<String> image = ['Image1', 'Image2'];

  Map data = {};
  String name;
  bool toGive = false;
  int invoiceNo = 8;
  int _value = 1;
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
                                  Text(Balance_message,
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
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                )),
                child: Padding(
                padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: SingleChildScrollView(
                      child: Column(
                          children: [
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
                                        color: Color.fromRGBO(11, 71, 109, 1.0),
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
                                            color: Color.fromRGBO(11, 71, 109, 1.0),
                                          )),
                                          SizedBox(width: 3,),
                                          Icon(Icons.calendar_today_rounded,
                                          color: Color.fromRGBO(11, 71, 109, 1.0),
                                          size: 15,)
                                    ],
                                  ),
                      ],
                      ),
                            Consumer<CartModel>(
                      builder:(context, cart, child){
                        objects = cart.cartList;
                        return Container(
                          child: (objects.length == 0)
                              ? SizedBox(height: 20)
                              : Column(
                            children: [
                              SizedBox(height: 20),
                              Container(
                                height: (objects.length > 2)? 100.0 :((objects.length)*50.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                      children: objects
                                          .map((sub) => itemCard(obj: sub))
                                          .toList()),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                            SizedBox(
                            height: 10,
                            ),
                            FlatButton(
                      onPressed: () {
                        widget.func(screenName:'catalog');
                        // Navigator.pushNamed(context, '/purchase4',arguments: {'name': data['name']});
                      },
                      height: 35,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text('ADD ITEMS (OPTIONAL)',
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 10.0,
                            color: Color.fromRGBO(11, 71, 109, 1.0),
                          )),
                      color: Color.fromRGBO(136, 182, 211, 0.67)),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                        height: 20,
                            ), Row(
                              children: [
                                Text("Total:",
                                  style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.black54,
                              )),
                               Consumer<CartModel>(
                                 builder:(context, cart, child){
                                   return Text(cart.totalPrice.toString());
                                 }
                               )
                              ],
                            ),

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
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Cash"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Bank"),
                                        value: 2,
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    }),
                              ),
                            ],
                          ),
                    ],
                  ),
                  SizedBox(height: 17,),
                  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20,)
                  ,
                  Column(
                    children: [
                      Text("Sub Total:",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                        )),
                      SizedBox(height: 5,),
                      Text("Rs. 0.00",
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
                      onPressed: () {
                        widget.func(screenName:'invoice');
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
                      color: Color.fromRGBO(11, 71, 109, 1.0)),
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
        ));
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

class CartModel extends ChangeNotifier{
  List<addItem> cartList = [];
  void addItems(object){
    cartList.add(object);
    notifyListeners();
  }
   double get totalPrice =>
     cartList.fold(0, (total, current) => total + (current.quantity*current.price));

}
