import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importando o botão customizado
import 'package:app_barber_shop/widgets/text/text_direitos.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_back.dart';
import 'package:app_barber_shop/screens/servico.dart'; // Importando a tela de serviço

// Tela de seleção de profissional
class ProfessionalSelectionScreen extends StatefulWidget {
  const ProfessionalSelectionScreen({super.key});

  @override
  _ProfessionalSelectionScreenState createState() => _ProfessionalSelectionScreenState();
}

class _ProfessionalSelectionScreenState extends State<ProfessionalSelectionScreen> {
  String? selectedProfessional; // Armazena o nome do profissional selecionado

  // Função para selecionar um profissional
  void selectProfessional(String name) {
    setState(() {
      selectedProfessional = name;
    });
  }

  // Função para navegar para a tela de serviço se um profissional for selecionado
  void navigateToNextScreen() {
    if (selectedProfessional != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServicoScreen(), // Redireciona para a tela de serviço
        ),
      );
    } else {
      // Exibe um aviso caso nenhum profissional tenha sido selecionado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione um profissional.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho com botão de voltar e botão do Instagram
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a tela anterior
                    },
                  ),
                  InstagramIconButton(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Título da tela
            Text(
              'Escolha um profissional',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            // Lista de profissionais
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(20),
                children: [
                  ProfessionalCard(
                    name: 'Carlos',
                    imageUrl: 'assets/carlos.png',
                    selectedProfessional: selectedProfessional,
                    onTap: selectProfessional,
                  ),
                  ProfessionalCard(
                    name: 'Eduardo',
                    imageUrl: 'assets/eduardo.png',
                    selectedProfessional: selectedProfessional,
                    onTap: selectProfessional,
                  ),
                  ProfessionalCard(
                    name: 'Paulo',
                    imageUrl: 'assets/paulo.png',
                    selectedProfessional: selectedProfessional,
                    onTap: selectProfessional,
                  ),
                  ProfessionalCard(
                    name: 'Antonio',
                    imageUrl: 'assets/antonio.jpg',
                    selectedProfessional: selectedProfessional,
                    onTap: selectProfessional,
                  ),
                ],
              ),
            ),
            // Botão de continuar e rodapé
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  //  CustomButtonGreen
                  CustomButton(
                    text: 'Continuar',
                    onPressed: navigateToNextScreen, // Chama a função para ir à próxima tela
                  ),
                  const SizedBox(height: 80),
                  // Botão de contato via WhatsApp
                  ContactButton(
                    text: 'Contato',
                    onPressed: () async {
                      const whatsappUrl = 'https://wa.me/5581999999999';
                      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                        await launchUrl(Uri.parse(whatsappUrl));
                      } else {
                        throw 'Não foi possível abrir o WhatsApp';
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextWidget(), // Texto de direitos autorais
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget que representa um card de profissional
class ProfessionalCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String? selectedProfessional;
  final Function(String) onTap;

  const ProfessionalCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.selectedProfessional,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedProfessional == name; // Verifica se o profissional está selecionado

    return GestureDetector(
      onTap: () => onTap(name), // Chama a função ao tocar no card
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: isSelected ? const BorderSide(color: Color(0xFF00FFB4), width: 3) : BorderSide.none,
        ),
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Nome do profissional
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
