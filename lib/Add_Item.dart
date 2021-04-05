import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';

void main() => runApp(MaterialApp(home: AddItem()));

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int val1 = 1;
  int val2 = 1;
  TextEditingController ProductName = new TextEditingController();
  TextEditingController PartnerName = new TextEditingController();
  TextEditingController CategoryTag = new TextEditingController();
  TextEditingController PurchasePrice = new TextEditingController();
  TextEditingController SalePrice = new TextEditingController();
  TextEditingController TaxRate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.arrow_back_ios),
          ),
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
                  child: input_text_fields("Product Name", ProductName),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child:
                      input_text_fields("Parnter Name (optional)", PartnerName),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Category Tag", CategoryTag),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Purchase Price", PurchasePrice),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Sale Price", SalePrice),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: input_text_fields("Tax Rate", TaxRate),
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
                                        if (val1 != 1) {
                                          setState(() {
                                            val1 = val1 - 1;
                                          });
                                        }
                                      },
                                      iconSize: 10,
                                      icon: Icon(Icons.remove)),
                                ),
                                Container(height: 15, child: VerticalDivider()),
                                SizedBox(width: 5),
                                Text("$val1"),
                                SizedBox(width: 5),
                                Container(height: 15, child: VerticalDivider()),
                                Container(
                                  width: 20,
                                  child: IconButton(
                                    onPressed: () {
                                          setState(() {
                                            val1 = val1 + 1;
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
                                        if (val2 != 1) {
                                          setState(() {
                                            val2 = val2 - 1;
                                          });
                                        }
                                      },
                                      iconSize: 10,
                                      icon: Icon(Icons.remove)),
                                ),
                                Container(height: 15, child: VerticalDivider()),
                                SizedBox(width: 5),
                                Text("$val2"),
                                SizedBox(width: 5),
                                Container(height: 15, child: VerticalDivider()),
                                Container(
                                  width: 20,
                                  child: IconButton(
                                    onPressed: () {
                                        setState(() {
                                          val2 = val2 + 1;
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
                       var temp = await DBprovider.db.addItem(ProductName.text.toString(), PartnerName.text.toString(), CategoryTag.text.toString(), PurchasePrice.text.toString(),SalePrice.text.toString(),TaxRate.text.toString(),val1,val2);
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

Widget input_text_fields(String label, TextEditingController name) {
  return TextField(
      controller: name,
      cursorColor: Colors.lightBlue,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: '$label',
        hintStyle: GoogleFonts.lato(
            textStyle: TextStyle(
          color: Color.fromRGBO(60, 60, 67, 0.3),
          fontSize: 14,
        )),
      ));
}

