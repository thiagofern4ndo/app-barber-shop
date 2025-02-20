import 'package:flutter/material.dart';
import 'package:app_barber_shop/screens/pag6.dart'; // Importa o pag6.dart
import 'package:app_barber_shop/screens/pag7.dart'; // Importa o pag7.dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Pag6(), // Altera para usar a classe Pag6
    );
  }
}