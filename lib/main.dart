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
import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var logged_in = false;

  runApp(MaterialApp(
      initialRoute: '/addAccount',

      routes: {
        '/': (context) => logged_in ? MyApp() : SignUp(),
        '/home': (context) => MyApp(),
        '/addItem': (context) => AddItem(),
        '/signIn': (context) => SignIn(),
        '/addAccount': (context) => AddAccounts(),
        '/addEquity': (context) => AddEquities(),
        '/addAssets': (context) => AddAssets(),
        '/addLoan': (context) => AddLoans(),
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
          accentColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
  ),

  ));
}

