import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/DataBase.dart';
class InventoryItem{
  final productID;
  final image;
  final String name;
  final int price;
  final int quantity;
  final int value;
  final partyName;
  final tag;
  final lowStock;
  bool display = true;
  InventoryItem({this.productID, this.name,this.price,this.quantity,
    this.value, this.image, this.partyName, this.tag, this.lowStock});
  setBool(bool newVal){
    display = newVal;
  }

}

class InventoryModel extends ChangeNotifier{
  List<InventoryItem> items = [];
  List<InventoryItem> displayItems = [];
  get maxPrice => items.fold(items.length == 0 ? 1:items[0].price, (previous, current) =>
  previous > current.price ? previous: current.price);
  get minPrice => items.fold(items.length == 0 ? 0:items[0].price, (previous, current) =>
  previous < current.price ? previous: current.price);
  get maxQuantity => items.fold(items.length == 0 ? 1:items[0].quantity, (previous, current) =>
  previous > current.quantity ? previous: current.quantity);
  get minQuantity => items.fold(items.length == 0 ? 0:items[0].quantity, (previous, current) =>
  previous < current.quantity ? previous: current.quantity);
  get getItems => displayItems.where((element) => element.display == true).toList();
  InventoryModel(){
    var initFuture = initializeCart();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  getCategories(){
    Set<String> categories = Set();
    items.forEach((element){
        categories.add(element.tag);
    });
    return categories;
  }
  initializeCart() async{
    items = await DBprovider.db.getInventory();
    displayItems = items;
  }
  reset() {
    displayItems = items;
    displayItems.forEach((element) {
      element.setBool(true);
    });
    notifyListeners();
  }
  filterItems({searchText, types, categoryVal, priceVals, quantityVals}) async {
    if (types.contains(1)) {
      searchText = searchText.toLowerCase();
      displayItems = items;
      displayItems.forEach((element) {
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
      displayItems = items;
      displayItems.forEach((element) {
        if (element.tag.toLowerCase() != categoryVal) {
          element.setBool(false);
        }
        else {
          element.setBool(true);
        }
      });
    }
    else if (types.contains(3)){
      displayItems = items;
      displayItems.forEach((element) {
        if (element.quantity > quantityVals.start && element.quantity < quantityVals.end) {
          element.setBool(true);
        }
        else {
          element.setBool(false);
        }
      });
    }
    else if (types.contains(4)){
      displayItems = items;
      displayItems.forEach((element) {
        if (element.price > priceVals.start && element.price < priceVals.end) {
          element.setBool(true);
        }
        else {
          element.setBool(false);
        }
      });
    }
    else if (types.contains(5)){
      displayItems = items;
      displayItems.forEach((element) {
        if (element.quantity > element.lowStock) {
          element.setBool(false);
        }
        else {
          element.setBool(true);
        }
      });

    }
    notifyListeners();
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
  removeItem(index){
    print(items[index].name);
    DBprovider.db.removeProduct(items[index].name);
    items.removeAt(index);
    notifyListeners();
  }
}




class temporary{
  final String name;
  final int price;
  final int quantity;
  final int value;

  temporary({this.name,this.price,this.quantity,this.value});
  static List<temporary> getAll(){
    List <temporary> temps = List<temporary> ();
    temps.add(temporary(name: 'Hello',price: 5, quantity: 5, value: 10));
    temps.add(temporary(name: 'Hello',price: 5, quantity: 5, value: 10));
    temps.add(temporary(name: 'Hello',price: 5, quantity: 5, value: 10));
    temps.add(temporary(name: 'Hello',price: 5, quantity: 5, value: 10));
    temps.add(temporary(name: 'Hello',price: 5, quantity: 5, value: 10));
    return temps;
  }

}
