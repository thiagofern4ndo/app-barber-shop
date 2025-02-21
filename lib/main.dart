import 'package:app_barber_shop/widgets/buttons/button_back.dart';
import 'package:app_barber_shop/widgets/buttons/button_checkbox.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/profile_button.dart';
import 'package:app_barber_shop/widgets/text/text_direitos.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button2.dart'; // Novo botão
import 'package:app_barber_shop/widgets/forms/custom_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Barber Shop'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Clique aqui',
                onPressed: () {
                  print('Botão 1 clicado!');
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Digite algo...',
              ),
              const SizedBox(
                  height: 20), // Espaçamento entre o campo e o novo botão
              CustomButton2(
                text: 'Clique aqui',
                onPressed: () {
                  print('Botão 2 clicado!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
