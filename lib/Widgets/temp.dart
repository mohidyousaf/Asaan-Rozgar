import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/DataBase.dart';
class InventoryItem{
  final String name;
  final int price;
  final int quantity;
  final int value;
  InventoryItem({this.name,this.price,this.quantity,this.value});

}
class InventoryModel extends ChangeNotifier{
  List<InventoryItem> items = [];
  get getItems => items;
  InventoryModel(){
    var initFuture = initializeCart();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  initializeCart() async{
    items = await DBprovider.db.getInventory();

  }
}