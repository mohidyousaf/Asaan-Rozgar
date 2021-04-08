import 'package:flutter/material.dart';
import 'DataBase.dart';


class Purchase3 extends StatefulWidget {
  @override
  _Purchase3State createState() => _Purchase3State();
}

class _Purchase3State extends State<Purchase3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context)
          },
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
      body: Column(
        children: <Widget>[
        Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Color.fromRGBO(52, 199, 89, 1.0),
          ),
        ],
      ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
            color: Colors.white,
             

          ),
        )
        ]
      )
    );
  }
}
