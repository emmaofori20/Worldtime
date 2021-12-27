import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';


void main() {
  runApp(MaterialApp(
    initialRoute : '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/choose_location': (context) => ChooseLocation()
    },
  ));
}


