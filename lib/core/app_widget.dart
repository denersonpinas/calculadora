import 'package:calculadora/imc/imc_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      home: ImcPage(),
    );
  }
}
