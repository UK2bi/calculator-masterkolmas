
import 'package:calculator/screens/converter-screen.dart';
import 'package:calculator/screens/history.dart';
import 'package:flutter/material.dart';

import 'screens/home-screen.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomeScreen(),
      '/history': (context) => HistoryScreen(),
      '/converter': (context) => ConverterScreen(),
    },
  ));
}
