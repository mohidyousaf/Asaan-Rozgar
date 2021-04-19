import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'DataBase.dart';
// import 'package:asaanrozgar/Components/orderItem.dart';


// void main() => runApp(MaterialApp(home: AddItem()));

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int quantity = 1;
  int minStock = 1;
  TextEditingController productName = new TextEditingController();
  TextEditingController partnerName = new TextEditingController();
  TextEditingController categoryTag = new TextEditingController();
  TextEditingController purchasePrice = new TextEditingController();
  TextEditingController salePrice = new TextEditingController();
  TextEditingController taxRate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context)
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          elevation: 0,
          title: Text("Add Item",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(250, 250, 250, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                )),
            child: Column(
              children: [
                Container(
                  child: SizedBox(height: 20),
                ),
                Container(
                    child: FlatButton.icon(
                        onPressed: () {},
                        padding: EdgeInsets.fromLTRB(80, 25, 80, 25),
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        icon: Icon(Icons.add_a_photo),
                        label: Text("          Upload Photo"))),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(label:"Product Name", controller:productName),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child:
                    InputTextFields(label:"Partner Name (optional)", controller:partnerName),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(label:"Category Tag", controller:categoryTag),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(label:"Purchase Price", controller:purchasePrice),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(label:"Sale Price", controller:salePrice),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(label:"Tax Rate", controller:taxRate),
                ),
                Container(
                    height: 35,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    child: Row(
                      children: [
                        Text("Quantity"),
                        SizedBox(width: 100),
                        Container(
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color.fromRGBO(118, 118, 128, 0.12)),
                            child: Row(
                              children: [
                                SizedBox(width: 5),
                                Container(
                                  width: 20,
                                  child: IconButton(
                                      onPressed: () {
                                        if (quantity != 1) {
                                          setState(() {
                                            quantity = quantity - 1;
                                          });
                                        }
                                      },
                                      iconSize: 10,
                                      icon: Icon(Icons.remove)),
                                ),
                                Container(height: 15, child: VerticalDivider()),
                                SizedBox(width: 5),
                                Text("$quantity"),
                                SizedBox(width: 5),
                                Container(height: 15, child: VerticalDivider()),
                                Container(
                                  width: 20,
                                  child: IconButton(
                                    onPressed: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                    },
                                    iconSize: 10,
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                SizedBox(width: 5),
                              ],
                            ))
                      ],
                    )),
                Container(
                    height: 35,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    child: Row(
                      children: [
                        Text("Minimum Stock"),
                        SizedBox(width: 53),
                        Container(
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color.fromRGBO(118, 118, 128, 0.12)),
                            child: Row(
                              children: [
                                SizedBox(width: 5),
                                Container(
                                  width: 20,
                                  child: IconButton(
                                      onPressed: () {
                                        if (minStock != 1) {
                                          setState(() {
                                            minStock = minStock - 1;
                                          });
                                        }
                                      },
                                      iconSize: 10,
                                      icon: Icon(Icons.remove)),
                                ),
                                Container(height: 15, child: VerticalDivider()),
                                SizedBox(width: 5),
                                Text("$minStock"),
                                SizedBox(width: 5),
                                Container(height: 15, child: VerticalDivider()),
                                Container(
                                  width: 20,
                                  child: IconButton(
                                    onPressed: () {
                                        setState(() {
                                          minStock = minStock + 1;
                                        });
                                    },
                                    iconSize: 10,
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                SizedBox(width: 5),
                              ],
                            ))
                      ],
                    )),
                SizedBox(height: 30),
                Container(
                  height: 40.0,
                  width: 200.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.grey[900],
                    color: Color.fromRGBO(255, 159, 10, 1.0),
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () async {
                        //TODO: have to change this to a class
                        List<addItem> order = [new addItem(
                            itemName: productName.text.toString(),
                            price: int.parse(purchasePrice.text.toString()),
                            quantity: quantity,
                            image: 'img',)];
                        Navigator.pushNamed(context, '/addItem2',
                        arguments: {
                          'obj':order,
                          'partyName':partnerName.text.toString(),
                            'tag':categoryTag.text.toString(),
                            'salePrice':salePrice.text.toString(),
                            'taxRate':taxRate.text.toString(),
                            'minStock':minStock}
                            );
                       // var temp = await DBprovider.db.addItem(
                       //     order,
                       //     partnerName.text.toString(),
                       //     categoryTag.text.toString(),
                       //     salePrice.text.toString(),
                       //     taxRate.text.toString(),
                       //     minStock);
                       // print(temp);
                      },
                      child: Center(
                        child: Text(
                          'Proceed',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

