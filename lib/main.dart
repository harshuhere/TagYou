import 'package:flutter/material.dart';
import 'package:tagyou/homepage.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {'login': (context) => MyHomePage()}),
  );
}
