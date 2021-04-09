import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 79,
      width: 375,
      margin: EdgeInsets.all(19.5),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 28,
      ),

      child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(

                // child: Text()
                children: [
                  RichText(

                      text: TextSpan(
                          style:TextStyle(
                            color: Color.fromRGBO(46,189,133,1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                          children: [
                            WidgetSpan(
                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: Icon(Icons.arrow_downward,
                                    color: Color.fromRGBO(46,189,133,1),
                                  ),
                                )
                            ),
                            TextSpan(
                              text: "You will Get",
                            ),


                          ]
                      )

                  ),

                  Text(
                    "Rs. 40,000",
                    style: TextStyle(
                      color: Color.fromRGBO(46,189,133,1),
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                    ),
                  )

                ],
              ),
            ),

            SizedBox(width: 10),
            VerticalDivider(thickness: 1),
            SizedBox(width: 10),

            Expanded(
              flex: 1,
              child: Column(
                // child: Text()
                children: [
                  RichText(
                      text: TextSpan(
                          style:TextStyle(
                            color: Color.fromRGBO(245,70,93,1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                          children: [
                            WidgetSpan(
                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: Icon(Icons.arrow_upward,
                                    color: Color.fromRGBO(245,70,93,1),
                                  ),
                                )
                            ),
                            TextSpan(
                              text: "You will Get",
                            ),


                          ]
                      )

                  ),
                  Text(
                    "Rs. 50,000",
                    style: TextStyle(
                      color: Color.fromRGBO(245,70,93,1),
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                    ),
                  )

                ],
              ),
            )
          ]
      ),

    );
  }
}
