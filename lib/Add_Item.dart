import 'dart:io';
import 'dart:async';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'DataBase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';

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
  PickedFile imageFile;
  final ImagePicker _picker = ImagePicker();

  _openGallery() async {
    var picture = await _picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
  }

  _openCamera() async {
    var picture = await _picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
  }

  Future<void> _choice(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 10, 1.0),
        appBar: std_appbar(context, 'Add Item', 255, 159, 10),
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
                    child: imageFile == null ? FlatButton.icon(
                        onPressed: () {
                          _choice(context);
                        },
                        padding: EdgeInsets.fromLTRB(80, 25, 80, 25),
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        icon: Icon(Icons.add_a_photo),
                        label: Text("          Upload Photo"))
                        : Row(
                          children: [

                            SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                            Image(image: FileImage(File(imageFile.path)),height: 80.0,width: 80.0,),
                            Icon(Icons.check,
                            color: Color.fromRGBO(52, 199, 89, 1.0),
                            size: 20,),
                            SizedBox(width: 2,),
                            Text(" Uploaded",
                            style: TextStyle(
                            color: Color.fromRGBO(52, 199, 89, 1.0),
                            fontFamily: "Lato",
                          )),
                          ],
                        ),
                        ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(
                      label: "Product Name", controller: productName),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(
                      label: "Partner Name",
                      controller: partnerName),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(
                      label: "Category Tag", controller: categoryTag),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(
                      label: "Purchase Price", controller: purchasePrice),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child: InputTextFields(
                      label: "Sale Price", controller: salePrice),
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(24, 14, 24, 7),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  child:
                      InputTextFields(label: "Tax Rate", controller: taxRate),
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
                    child: TextButton(
                      onPressed: () async {
                        //TODO: have to change this to a class
                        List<addItem> order = [
                          new addItem(
                            itemName: productName.text.toString(),
                            price: int.parse(purchasePrice.text.toString()),
                            quantity: quantity,
                            image: 'img',
                          )
                        ];
                        Navigator.pushNamed(context, '/addItem2', arguments: {
                          'obj': order,
                          'partyName': partnerName.text.toString(),
                          'tag': categoryTag.text.toString(),
                          'salePrice': salePrice.text.toString(),
                          'taxRate': taxRate.text.toString(),
                          'minStock': minStock
                        });
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
