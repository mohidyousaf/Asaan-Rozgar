import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/DataBase.dart';
class InventoryItem{
  final image;
  final String name;
  final int price;
  final int quantity;
  final int value;
  bool display = true;
  InventoryItem({this.name,this.price,this.quantity,this.value, this.image});
  setBool(bool newVal){
    display = newVal;
  }

}

class InventoryModel extends ChangeNotifier{
  List<InventoryItem> items = [];
  List<InventoryItem> displayItems = [];
  get getItems => displayItems.where((element) => element.display == true).toList();
  InventoryModel(){
    var initFuture = initializeCart();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  initializeCart() async{
    items = await DBprovider.db.getInventory();
    displayItems = items;
  }
  filterItems(text) async{
    print(text);

  }
  searchItems(text) async{
    print(text);
    text = text.toLowerCase();
    displayItems = items;
    print('before $displayItems');
    RegExp match = new RegExp('^$text');
    displayItems.forEach((element) {
      if (!match.hasMatch(element.name.toLowerCase())){
        element.setBool(false);
      }
      else{
        element.setBool(true);
      }
    });
    print('after $displayItems');
    notifyListeners();
  }
}
