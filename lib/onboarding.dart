import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/onboarding_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import './home.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(

//       home: Onboarding(),
//   ));
// }

final control = OnboardingController();
class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: control.onboardingScreens.length,
        itemBuilder: (context,index) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:50.0, vertical: 30),
                child: Text(control.onboardingScreens[index].title,
                style:TextStyle(
                  color: Color.fromRGBO(37,37,41,1),
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,       
                
                ),
                textAlign: TextAlign.center,
                ),
              ),
              
              Image.asset(control.onboardingScreens[index].image),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 60),
                child: Text(control.onboardingScreens[index].subtitle,
                style:TextStyle(
                  color: Color.fromRGBO(37,37,41,1),
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,       
                ),
                textAlign: TextAlign.center,
                ),
              ),
              DotsIndicator(
                dotsCount: control.onboardingScreens.length,
                position: index,
                decorator: DotsDecorator(
                              activeColor: Color.fromRGBO(11, 71, 109, 1),
),
),
          SizedBox(height: 15,),
          index ==3?  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyApp()
                       )
                   );
                    },
                    height: 50,
                    minWidth: 130,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Let\'s Get Started',
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.white
                        )),
                    color: Color.fromRGBO(11, 71, 109, 1.0)):Container(),
            ],
          
          )
        );
      }
      ),
    );
  }
}