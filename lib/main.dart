import 'package:flutter/material.dart';
// import 'DataBase.dart';
import 'package:asaanrozgar/home.dart';
import 'package:asaanrozgar/SignUp.dart';
import 'package:asaanrozgar/Add_Item.dart';
import 'package:asaanrozgar/SignIn.dart';
import 'package:asaanrozgar/AddAccount.dart';
import 'package:asaanrozgar/AddAssets.dart';
import 'package:asaanrozgar/AddEquity.dart';
import 'package:asaanrozgar/AddLoan-1.dart';
import 'package:asaanrozgar/AddLoan-2.dart';
import 'package:asaanrozgar/MENU.dart';
import 'package:asaanrozgar/AddCompany.dart';
import 'package:asaanrozgar/CompanySetup.dart';
import 'package:asaanrozgar/CompanySetup1.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var loggedIn = prefs.getString('loggedIn');
  print(loggedIn);


  runApp(MaterialApp(
      // initialRoute: '/addAccount',
      debugShowCheckedModeBanner:false,
      routes: {
        '/': (context) => loggedIn != null ? MyApp() : SignUp(),
        '/home': (context) => MyApp(),
        '/menu': (context) => Menu(),
        '/addItem': (context) => AddItem(),
        '/signIn': (context) => SignIn(),
        '/addAccount': (context) => AddAccounts(),
        '/addEquity': (context) => AddEquities(),
        '/addAssets': (context) => AddAssets(),
        '/addLoan1': (context) => AddLoans(),
        '/addLoan2': (context) => AddLoans_2(),
        '/addCompany': (context) => AddCompany(),
        '/setup1': (context) => company_setup(),
        '/setup2': (context) => company_setup1(),

      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
          accentColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
  ),

  ));
}

