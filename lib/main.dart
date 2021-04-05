import 'package:flutter/material.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/home.dart';
import 'package:asaanrozgar/SignUp.dart';
import 'package:asaanrozgar/Add_Item.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => signup(),
        '/home': (context) => MyApp(),
        '/addItem': (context) => AddItem(),
      }

  ));
}

