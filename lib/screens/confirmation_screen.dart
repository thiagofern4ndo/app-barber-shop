import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button2.dart'; // Importa o CustomButton2
import 'package:app_barber_shop/widgets/buttons/custom_button3.dart'; // Importa o CustomButton2
import 'package:app_barber_shop/widgets/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:app_barber_shop/widgets/text/text_direitos.dart'; // Importa o TextWidget
import 'package:google_fonts/google_fonts.dart'; // Importa o GoogleFonts

class ConfirmationScreen extends StatefulWidget {
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 20,
            child: CustomBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), // Adiciona o CustomBackButton no canto superior esquerdo
          ),
          Positioned(
            top: 10,
            right: 20,
            child: InstagramIconButton(), // Adiciona o IconButton no canto superior direito
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150), // Adiciona espaço extra na parte superior
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 100,
                      bottom: 10), // 10 pixels acima e 10 abaixo do título
                  child: Text(
                    'Informações do agendamento',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20, // Tamanho do texto
                      fontWeight: FontWeight.bold, // Texto em negrito
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton3(
                    text: 'Profissional:    Carlos'
                        .toUpperCase(), // Adiciona espaços para o traço
                    onPressed: () {
                      // Ação ao pressionar o botão
                    },
                    isSelected: false,
                    alignment: Alignment.centerLeft, // Alinha o texto à esquerda
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton3(
                    text: 'Serviço:         Combo'
                        .toUpperCase(), // Adiciona espaços para o traço
                    onPressed: () {
                      // Ação ao pressionar o botão
                    },
                    isSelected: false,
                    alignment: Alignment.centerLeft, // Alinha o texto à esquerda
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton3(
                    text: 'Data:           03/03/2025'
                        .toUpperCase(), // Adiciona espaços para o traço
                    onPressed: () {
                      // Ação ao pressionar o botão
                    },
                    isSelected: false,
                    alignment: Alignment.centerLeft, // Alinha o texto à esquerda
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton3(
                    text: 'Hora:           08:00'
                        .toUpperCase(), // Adiciona espaços para o traço
                    onPressed: () {
                      // Ação ao pressionar o botão
                    },
                    isSelected: false,
                    alignment: Alignment.centerLeft, // Alinha o texto à esquerda
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: CustomButton(
                    text: 'Confirmar agendamento',
                    onPressed: () {
                      // Ação ao pressionar o botão Confirmar agendamento
                    },
                    isSelected: false,
                    width: 300, // Ajuste a largura conforme necessário
                    height: 40, // Ajuste a altura conforme necessário
                    fontSize: 18, // Ajuste o tamanho da fonte conforme necessário
                  ),
                ),
                Spacer(), // Adiciona um Spacer para empurrar os widgets para baixo
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CustomButton2(
                      text: 'Contato',
                      onPressed: () {
                        // Ação ao pressionar o botão de contato
                      },
                      borderRadius: 10,
                      height: 30,
                      width: 130,
                      isSelected: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40), // Ajuste o valor conforme necessário
                    child: TextWidget(),
                  ),
                ),
                const SizedBox(
                    height: 7), // Adiciona um SizedBox para ajustar a distância
              ],
            ),
          ),
        ],
      ),
    );
  }
}
