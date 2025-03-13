import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart'; // Importa o ContactButton
import 'package:app_barber_shop/widgets/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:app_barber_shop/widgets/text/text_direitos.dart'; // Importa o TextWidget
import 'package:app_barber_shop/widgets/buttons/custom_button2.dart'; // Importa o CustomButton2

class PerfilPages extends StatefulWidget {
  @override
  _PerfilPages createState() => _PerfilPages();
}

class _PerfilPages extends State<PerfilPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10), // Ajuste o valor conforme necessário
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Color(0xFF00FFB4),
                  size: 40,
                ),
                const SizedBox(width: 20), // Espaço entre o ícone e o texto
                Expanded(
                  child: Center(
                    child: Text(
                      'nome e email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50), // Ajuste o valor conforme necessário
            child: Center(
              child: Image.asset(
                'assets/logo.png', // Substitua pelo caminho da sua imagem
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: 300, // Defina a largura desejada
                  height: 50, // Defina a altura desejada
                  child: CustomButton2(
                    fontSize: 20,
                    text: 'Reservas Ativas',
                    onPressed: () {
                      // Ação ao pressionar o botão 1
                    },
                    isSelected: false,
                    borderRadius: 15, // Ajuste o valor conforme necessário
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: 300, // Defina a largura desejada
                  height: 50, // Defina a altura desejada
                  child: CustomButton2(
                    fontSize: 20,
                    text: 'Histórico de Reservas',
                    onPressed: () {
                      // Ação ao pressionar o botão 2
                    },
                    isSelected: false,
                    borderRadius: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: 300, // Defina a largura desejada
                  height: 50, // Defina a altura desejada
                  child: CustomButton2(
                    fontSize: 20,
                    text: 'Informações Pessoais',
                    onPressed: () {
                      // Ação ao pressionar o botão 3
                    },
                    isSelected: false,
                    borderRadius: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: 300, // Defina a largura desejada
                  height: 50, // Defina a altura desejada
                  child: CustomButton2(
                    fontSize: 20,
                    text: 'FeedBack',
                    onPressed: () {
                      // Ação ao pressionar o botão 4
                    },
                    isSelected: false,
                    borderRadius: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: 300, // Defina a largura desejada
                  height: 50, // Defina a altura desejada
                  child: CustomButton2(
                    fontSize: 20,
                    text: 'Termos de Uso',
                    onPressed: () {
                      // Ação ao pressionar o botão 5
                    },
                    isSelected: false,
                    borderRadius: 15,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ContactButton(
                text: 'Contato',
                onPressed: () {
                  // Ação ao pressionar o botão de contato
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextWidget(),
            ),
          ),
        ],
      ),
    );
  }
}