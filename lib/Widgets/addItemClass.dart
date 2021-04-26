import 'package:flutter/material.dart';

class invoice extends StatelessWidget {
  final String itemName;
  final int price;
  final int quantity;

  invoice({this.itemName, this.price, this.quantity});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class addItem extends StatelessWidget {
  final String itemName;
  final int price;
  final int quantity;
  final String image;

  addItem({this.itemName, this.price, this.quantity, this.image});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class itemList extends StatelessWidget {
  final String itemName;
  final String image;
  final int quantity;

  itemList({this.itemName, this.image, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class report_items extends StatelessWidget {
  
  final String itemName;
  final int price;

  report_items({this.itemName, this.price});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class inventory_items extends StatelessWidget {
  
  String itemName;
  double profit_loss;
  double sale;

  inventory_items({this.itemName,this.profit_loss, this.sale});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}