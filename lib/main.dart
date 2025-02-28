/*import 'package:app_barber_shop/widgets/buttons/button_back.dart';
import 'package:app_barber_shop/widgets/buttons/button_checkbox.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/profile_button.dart';
import 'package:app_barber_shop/widgets/text/text_direitos.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button2.dart';
import 'package:app_barber_shop/widgets/forms/custom_text_field.dart';
import 'package:app_barber_shop/screens/splash.dart'; 


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
    var fontSize = 16;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Barber Shop'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Clique aqui',
                  onPressed: () {
                    print('Botão 1 clicado!');
                  }, fontSize: fontSize,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Digite algo...',
                ),
                const SizedBox(height: 20),
                CustomButton2(
                  text: 'Clique aqui',
                  onPressed: () {
                    print('Botão 2 clicado!');
                  }, fontSize: 17,
                ),
                const SizedBox(height: 20),
                ContactButton(
                  text: 'Contato',
                  onPressed: () {
                    print('Botão Contato clicado');
                  },
                ),
                const SizedBox(height: 5),
                TextWidget(),
                const SizedBox(height: 10),
                InstagramIconButton(),
                const SizedBox(height: 10),
                ProfileIconButton(),
                const SizedBox(height: 10),
                CustomCheckBox(
                  text: 'Selecione',
                  isChecked: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomBackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:app_barber_shop/screens/splash.dart';
import 'package:app_barber_shop/screens/mainscreen.dart';
import 'package:app_barber_shop/screens/loginpage.dart';
import 'package:app_barber_shop/screens/profissionais.dart';
import 'package:app_barber_shop/screens/servico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Define a cor de fundo global
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MainScreen(),
        '/login': (context) => const LoginPage(),
        '/profissionais': (context) => const ProfessionalSelectionScreen(),
        '/servico': (context) => const ServicoScreen(),
      },
    );
  }
}



