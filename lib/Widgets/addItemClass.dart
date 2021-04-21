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
