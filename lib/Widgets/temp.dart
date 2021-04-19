
class Inventory{
  final String name;
  final int Price;
  final int quantity;
  final int value;
  Inventory({this.name,this.Price,this.quantity,this.value});

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

