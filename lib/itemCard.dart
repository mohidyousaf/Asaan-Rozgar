import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';

class inventory_list extends StatelessWidget {
  final inventory_items obj4;
  inventory_list({this.obj4});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 5),
              Text(obj4.itemName,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  )),
              Spacer(),
              Text(obj4.profit_loss.toString(),
                  style: TextStyle(
                    color: Color.fromRGBO(46, 189, 133, 1),
                    fontFamily: "Lato",
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  )),
              Spacer(),
              Text(obj4.sale.toString(),
                  style: TextStyle(
                    color: Color.fromRGBO(46, 189, 133, 1),
                    fontFamily: "Lato",
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  )),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        ],
      ),
    );
  }
}

class report_list extends StatelessWidget {
  final report_items obj3;
  report_list({this.obj3});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 5),
            Text(obj3.itemName.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                )),
            Spacer(),
            Text(obj3.price.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                )),
          ],
        ),
      ],
    );
  }
}

class invoice_list extends StatelessWidget {
  final addItem obj2;
  invoice_list({this.obj2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(obj2.itemName,
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
                color: Colors.black,
              )),
          SizedBox(width: obj2.itemName.length > 5 ? 100 : 110),
          Text(obj2.quantity.toString(),
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
                color: Colors.black,
              )),
          SizedBox(width: obj2.quantity < 100 ? 128 : 120),
          Text(obj2.price.toString(),
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}

class cart extends StatelessWidget {
  final InventoryItem obj1;
  final Function pass;
  cart({this.obj1, this.pass});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
          onPressed: pass,
          height: 50,
          minWidth: 300,
          child: Row(
            children: [
              Text(obj1.image.toString(),
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color.fromRGBO(136, 182, 211, 0.67))),
              SizedBox(
                width: 15,
              ),
              Text(obj1.name.toString(),
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  )),
              SizedBox(
                width: 15,
              ),
              Text(obj1.quantity.toString(),
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class itemCard extends StatelessWidget {
  final addItem obj;
  itemCard({this.obj});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          ListTile(
            leading: Text('img'),
            title: Text(
              '${obj.itemName}',
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.normal,
                fontSize: 17.0,
                color: Color.fromRGBO(38, 51, 58, 1.0),
              ),
            ),
            subtitle: Text(' Item Subtotal'),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    (obj.price * obj.quantity).toString(),
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color.fromRGBO(11, 71, 109, 1.0)),
                  ),
                  Text(
                    '${obj.quantity} x Rs. ${obj.price}',
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w100,
                        fontSize: 13.0,
                        color: Colors.grey[500] //parties
                        ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.5,
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}
