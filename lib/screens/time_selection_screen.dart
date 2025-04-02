import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart'; // Importa o InstagramIconButton
import 'package:app_barber_shop/components/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:app_barber_shop/components/theme/fonts.dart'; // Importa o GoogleFonts
import 'package:app_barber_shop/components/text/text_direitos.dart'; // Importa o TextDireitos
import 'package:app_barber_shop/components/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:app_barber_shop/components/buttons/custom_button2.dart'; // Importa o CustomButton2
import 'package:app_barber_shop/components/buttons/button_contact.dart'; // Importa o CustomButton2


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
  final List<String> horarios = [
    for (int i = 8; i <= 19; i++) '${i.toString().padLeft(2, '0')}:00'
  ];

  String? horarioSelecionado;

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
                const SizedBox(height: 120),
                Text(
                  'Selecione um horário',
                  style: AppFonts.main.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Lista de horários
                Expanded(
                  child: GridView.builder(
                    itemCount: horarios.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 4,
                    ),
                    itemBuilder: (context, index) {
                      return _buildHorarioButton(horarios[index]);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // Botão "Continuar"
                Center(
                  child: CustomButton(
                    text: 'Continuar',
                    onPressed: () {
                      // Chama a função ContactButton
                    },
                    isSelected: false,
                  ),
                ),
                const SizedBox(height: 30),
                // Botão "Contato"
                ContactButton(
                  text: 'Contato',
                  onPressed: () {
                    // Ação ao pressionar o botão de contato
                    // Adicione aqui a lógica desejada
                  },
                ),
                const SizedBox(height: 10),
                // Rodapé
                const TextWidget(),
                const SizedBox(height: 7),
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

  Widget _buildHorarioButton(String text) {
    bool isSelected = horarioSelecionado == text;

    return CustomButton2(
      text: text,
      onPressed: () {
        setState(() {
          horarioSelecionado = text;
        });
      },
      width: 120, // Define uma largura menor
      height: 40, // Define uma altura menor
      fontSize: 20,
      isSelected: isSelected, // Usa a variável isSelected
    );
  }
}
