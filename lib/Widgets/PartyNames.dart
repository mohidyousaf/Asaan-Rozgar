import 'package:flutter/material.dart';

class PartyNAme extends StatelessWidget {

  final String name;
  final Function pass;
  PartyNAme({this.name,this.pass});


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            child: FlatButton(
              onPressed: pass,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(name),
                      SizedBox(height: 5),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        color: Color.fromRGBO( 230, 231, 231, 1.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
