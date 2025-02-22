import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart'; // Importa o InstagramIconButton
import 'package:app_barber_shop/widgets/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:app_barber_shop/widgets/buttons/button_horario.dart'; // Importa o ButtonHorario
import 'package:google_fonts/google_fonts.dart'; // Importa o GoogleFonts
import 'package:app_barber_shop/widgets/text/text_direitos.dart'; // Importa o TextDireitos
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart';

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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                const ButtonHorario(),
                const SizedBox(height: 10),
                // Botão "Continuar"
                Center(
                  child: CustomButton(
                    text: 'Continuar',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 10),
                // Botão "Contato"
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'contato',
                    style: GoogleFonts.poppins(
                      color: Colors.greenAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Rodapé
                TextWidget(),
              ],
            ),
          ),
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
            child:
                InstagramIconButton(), // Adiciona o InstagramIconButton no canto superior direito
          ),
        ],
      ),
    );
  }
}
