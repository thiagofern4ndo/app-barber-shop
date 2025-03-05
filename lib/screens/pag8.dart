import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart'; // Importa o InstagramIconButton
import 'package:app_barber_shop/widgets/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:app_barber_shop/widgets/buttons/button_horario.dart'; // Importa o ButtonHorario
import 'package:google_fonts/google_fonts.dart'; // Importa o GoogleFonts
import 'package:app_barber_shop/widgets/text/text_direitos.dart'; // Importa o TextDireitos
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';

class Pag8 extends StatelessWidget {
  const Pag8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SelecionarHorarioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SelecionarHorarioScreen extends StatefulWidget {
  const SelecionarHorarioScreen({super.key});

  @override
  State<SelecionarHorarioScreen> createState() =>
      _SelecionarHorarioScreenState();
}

class _SelecionarHorarioScreenState extends State<SelecionarHorarioScreen> {
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
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 300, // Defina o tamanho máximo desejado
              ),
              child: Column(
                children: [
const SizedBox(height: 100), // Adiciona spaço extra na parte superior
                  const SizedBox(height: 60), // Espaço para os botões no topo
                  Text(
                    'Selecione um horário',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Lista de horários
                  const Expanded(child: ButtonHorario()),
                  const SizedBox(height: 10),
                  // Botões na parte inferior
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: CustomButton(
                            text: 'Continuar',
                            onPressed: () {
                              // Ação ao pressionar o botão Continuar
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
