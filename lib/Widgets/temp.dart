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

<<<<<<< HEAD
 static List<Inventory> getinventory (){
   List<Inventory> items = List<Inventory>();
   items.add(Inventory(name: "Lays",Price: 40, quantity: 50, value: 200));
   items.add(Inventory(name: "dairy milk",Price: 40, quantity: 40, value: 100));
   items.add(Inventory(name: "hersheys",Price: 40, quantity: 80, value: 100));
   items.add(Inventory(name: "herss",Price: 40, quantity: 80, value: 100));
   items.add(Inventory(name: "heys",Price: 40, quantity: 80, value: 100));
   items.add(Inventory(name: "heys",Price: 40, quantity: 80, value: 100));
   items.add(Inventory(name: "bournville",Price: 80, quantity: 150, value: 250));
   items.add(Inventory(name: "bournlle",Price: 80, quantity: 150, value: 250));
   items.add(Inventory(name: "bournvil",Price: 80, quantity: 150, value: 250));
   items.add(Inventory(name: "bville",Price: 80, quantity: 150, value: 250));
   return items;
 }
}

=======
  }
}
>>>>>>> 1b8227582bfe35c5ef61cd487142122549001327
