import 'package:flutter/material.dart';

import 'package:app_barber_shop/widgets/buttons/button_contact.dart'; // Importa o ContactButton

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
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 15), // Ajuste o valor conforme necessário
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Centraliza horizontalmente
                          children: [
                            Text(
                              'nome',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                height: 5), // Espaço entre o nome e o email
                            Text(
                              'email@example.com',
                              style: TextStyle(
                                color: Colors
                                    .white70, // Cor mais clara para o email
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10), // Ajuste o valor conforme necessário
                child: Center(
                  child: Image.asset(
                    'assets/logo.png', // Substitua pelo caminho da sua imagem
                    width: 150,
                    height: 80,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: SizedBox(
                      width: 300, // Defina a largura desejada
                      height: 40, // Defina a altura desejada
                      child: CustomButton2(
                        fontSize: 20,
                        text: 'Reservas Ativas',
                        onPressed: () {
                          // Ação ao pressionar o botão 1
                        },
                        isSelected: false,
                        borderRadius: 10, // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: 300, // Defina a largura desejada
                      height: 40, // Defina a altura desejada
                      child: CustomButton2(
                        fontSize: 20,
                        text: 'Histórico ',
                        onPressed: () {
                          // Ação ao pressionar o botão 2
                        },
                        isSelected: false,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: 300, // Defina a largura desejada
                      height: 40, // Defina a altura desejada
                      child: CustomButton2(
                        fontSize: 20,
                        text: 'Favoritos',
                        onPressed: () {
                          // Ação ao pressionar o botão 2
                        },
                        isSelected: false,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: 300, // Defina a largura desejada
                      height: 40, // Defina a altura desejada
                      child: CustomButton2(
                        fontSize: 20,
                        text: 'Informações Pessoais',
                        onPressed: () {
                          // Ação ao pressionar o botão 3
                        },
                        isSelected: false,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: 300, // Defina a largura desejada
                      height: 40, // Defina a altura desejada
                      child: CustomButton2(
                        fontSize: 20,
                        text: 'FeedBack',
                        onPressed: () {
                          // Ação ao pressionar o botão 4
                        },
                        isSelected: false,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: 300, // Defina a largura desejada
                      height: 40, // Defina a altura desejada
                      child: CustomButton2(
                        fontSize: 20,
                        text: 'Termos de Uso',
                        onPressed: () {
                          // Ação ao pressionar o botão 5
                        },
                        isSelected: false,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextWidget(),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Color(0xFF00FFB4),
                size: 35,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
