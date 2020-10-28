import 'package:covid19/pages/choose_location.dart';
import 'package:covid19/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:covid19/pages/home.dart';
void main() => runApp(MaterialApp(
 initialRoute: '/',
  routes: {
    '/': (context) =>  Loading(),
    '/home': (context) => Home(),
    '/location':(context) => ChooseLocation()
  },
));
