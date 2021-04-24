import 'dart:ffi';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:asaanrozgar/Widgets/validationFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Sale2.dart';



class Sale3 extends StatefulWidget {
  Sale3({this.func, this.object});
  Function func;
  InventoryItem object;

  @override
  _Sale3State createState() => _Sale3State();
}

class _Sale3State extends State<Sale3> {
  String image = "Image1";
  String name;
  int total;
  TextEditingController price = new TextEditingController();
  TextEditingController quantity = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValid = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {

    setState(() {
      name=widget.object.name;
    });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Choose Item",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              children:[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width * 0.55,
                      color: Color.fromRGBO(52, 199, 89, 1.0),
                    ),],),
                SizedBox(height: 20,),
                Center(
                  child: Column(
                    children: [
                      Text("Please Enter detail of your purchase below so that we",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                          )),
                      Text("will update your account reccords accordingly",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 40,),
                    Text("Image1",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.black54,
                        )),
                    SizedBox(width: 20,),
                    Text(name,
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Form(
                      autovalidateMode: autoValid,
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text("Sale Price:",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.black54,
                              )),
                          Row(
                            children: [
                              Text("Rs. ${widget.object.price.toString()}",
                                  style: TextStyle(
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                  )),
                              SizedBox(width: 10,),
                                Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("Quantity:",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.black54,
                              )),
                          Row(
                            children: [
                              SizedBox(width: 32,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextFormField(
                                  onChanged: (quantity){
                                    try{
                                      setState(() {
                                        total = int.parse(quantity) *
                                            widget.object.price;
                                      });
                                    }
                                    catch(e){

                                    }
                                  },
                                  validator: (text){
                                    return ValidationFunctions.validateQuantity(text: text, args:widget.object.quantity);
                                  },
                                  controller: quantity,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sub Total:",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color.fromRGBO(11, 71, 109, 1.0),
                            )),
                        SizedBox(height: 5,),
                        Text(total.toString(),
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              color: Color.fromRGBO(11, 71, 109, 1.0),
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        onPressed: () {
                        if (_formKey.currentState.validate()) {
                          int temp2 = int.parse(quantity.text);
                          //TODO: HAVE TO CHANGE STATE OF CATALOG HERE (CONSUMER)
                          Provider.of<CartModel>
                            (context, listen: false).addItems(new addItem(
                              itemName: this.name,
                              price: widget.object.price,
                              quantity: temp2,
                              image: 'image'));
                          widget.func(screenName: 'catalog');
                          // Navigator.pushNamed(context, '/purchase2', arguments: {
                          //   'obj': addItem(itemName:name, price:temp1 , quantity:temp2, image:'Image1'),
                          // } );
                        }
                        else{
                          setState((){
                            autoValid = AutovalidateMode.always;
                          });
                        }
                        },
                        height: 30,
                        minWidth: 90,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('SAVE',
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.normal,
                                fontSize: 10.0,
                                color: Colors.white
                            )),
                        color: Color.fromRGBO(11, 71, 109, 1.0)),
                    SizedBox(width: 50,),
                  ],
                )

              ]),
        ));
  }
}

