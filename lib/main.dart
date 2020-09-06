import 'package:app_flutter/segundaTela.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      home: SegundaTela(),
      debugShowCheckedModeBanner: false,
    );
  }
}
