import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/text/text_direitos.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_back.dart';
import 'package:app_barber_shop/widgets/buttons/button_checkbox.dart'; // Importando o CustomCheckBox
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importando o CustomButton
import 'pag7.dart'; // importando a tela Pag7 do Giovanni

// Controller para a lógica de navegação entre as telas
class ServicoController {
  final bool isCorteChecked;
  final bool isBarbaChecked;
  final bool isComboChecked;

  // Construtor que recebe os estados dos checkboxes como parâmetros
  ServicoController({
    required this.isCorteChecked,
    required this.isBarbaChecked,
    required this.isComboChecked,
  });

  // Função para navegar para a tela Pag7 ou exibir uma mensagem de erro
  void navigateToNextScreen(BuildContext context) {
    if (isCorteChecked || isBarbaChecked || isComboChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pag7(), // Direciona para a tela Pag7
        ),
      );
    } else {
      // Exibe uma mensagem de erro caso nenhum serviço tenha sido selecionado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione ao menos um serviço.')),
      );
    }
  }
}

// Tela onde o usuário pode selecionar um serviço
class ServicoScreen extends StatefulWidget {
  const ServicoScreen({super.key});

  @override
  _ServicoScreenState createState() => _ServicoScreenState();
}

class _ServicoScreenState extends State<ServicoScreen> {
  // Variáveis de controle para os checkboxes
  bool isCorteChecked = false;
  bool isBarbaChecked = false;
  bool isComboChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // SafeArea para não sobrepor a UI nas bordas
        child: Column(
          children: [
            // Cabeçalho com botões de navegação e Instagram
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton( // Botão de voltar
                    onPressed: () {
                      Navigator.pop(context); // Retorna para a tela anterior
                    },
                  ),
                  InstagramIconButton(), // Botão para abrir Instagram
                ],
              ),
            ),
            const SizedBox(height: 90),
            // Título da tela
            Text(
              'Selecione um serviço',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            // Seção de seleção dos serviços com checkboxes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomCheckBox( // Checkbox para o serviço "Corte"
                    text: 'Corte',
                    isChecked: isCorteChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isCorteChecked = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomCheckBox( // Checkbox para o serviço "Barba"
                    text: 'Barba',
                    isChecked: isBarbaChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isBarbaChecked = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomCheckBox( // Checkbox para o serviço "Combo"
                    text: 'Combo',
                    isChecked: isComboChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isComboChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Spacer(), // Empurra o botão para a parte inferior da tela
            // Botão "Continuar" que navega para a tela Pag7
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton( // Usando o CustomButton reutilizável
                text: 'Continuar',
                onPressed: () {
                  // Verifica se pelo menos um serviço foi selecionado
                  if (isCorteChecked || isBarbaChecked || isComboChecked) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pag7(), // Navega para a tela Pag7
                      ),
                    );
                  } else {
                    // Exibe uma mensagem de erro caso nenhum serviço tenha sido selecionado
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, selecione ao menos um serviço.')),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 100),
            // Seção de contato com WhatsApp
            ContactButton(
              text: 'Contato',
              onPressed: () async {
                const whatsappUrl = 'https://wa.me/5581999999999'; // URL do WhatsApp
                if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                  await launchUrl(Uri.parse(whatsappUrl)); // Abre o WhatsApp
                } else {
                  throw 'Não foi possível abrir o WhatsApp'; // Exibe erro caso não consiga abrir
                }
              },
            ),
            const SizedBox(height: 20),
            TextWidget(), // Texto de direitos autorais ou outras informações
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
