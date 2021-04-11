import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asaanrozgar/onboarding_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//
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
            ],
          )
        );
      }
      ),
    );
  }
}