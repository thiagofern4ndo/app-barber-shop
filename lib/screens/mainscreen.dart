import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_barber_shop/widgets/buttons/profile_button.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/text/text_direitos.dart';
// import 'loginpage.dart';//importando a tela de login

// Tela principal do aplicativo onde o usuário pode agendar horários e entrar em contato
class MainScreen extends StatelessWidget {
  const MainScreen({super.key}); // Construtor da tela principal

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SafeArea(
        child: Column(
          children: [
            // Barra superior com botões de perfil e Instagram
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Disposição dos ícones à esquerda e à direita
                children: [
                  ProfileIconButton(), // Ícone do perfil
                  InstagramIconButton(), // Ícone do Instagram
                ],
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre a barra superior e o conteúdo abaixo

            Spacer(), // Espaço flexível que empurra os elementos para a parte superior

            // Exibição do logo do barbeiro centralizado
            Center(
              child: Image.asset(
                'assets/barber.png', // Caminho da imagem do logo
                width: 250,  // Largura da imagem
                height: 250, // Altura da imagem
              ),
            ),
            const SizedBox(height: 50), // Espaçamento abaixo da logo

            // Botão "Agende seu horário", que navega para a página de login
            CustomButton(
              text: 'Agende seu horário', // Texto exibido no botão
              onPressed: () {
                print('Botao pressionado, chamar tela de login quando construida');
                // Navega para a página de login ao clicar no botão
                // Navigator.push(
                  // context,
                  //  MaterialPageRoute(builder: (context) => LoginPage())
                // );
              },
               width: 320, // Largura do botão
               height: 50, // Altura do botão
              color: const Color(0xFF00FFB4), // Cor personalizada do botão
            ),
            const SizedBox(height: 80), // Espaçamento entre os botões

            // Botão "Contato" que abre o WhatsApp
            ContactButton(
              text: 'Contato', // Texto exibido no botão
              onPressed: () async {
                const whatsappUrl = 'https://wa.me/5581999999999'; // URL para abrir o WhatsApp com um número específico
                if (await canLaunch(whatsappUrl)) {
                  await launch(whatsappUrl); // Tenta abrir o WhatsApp
                } else {
                  throw 'Não foi possível abrir o WhatsApp'; // Erro caso não consiga abrir
                }
              },
            ),
            const SizedBox(height: 20), // Espaçamento inferior entre os botões

            // Texto de rodapé exibindo direitos autorais
            TextWidget(), // Exibe o texto "Todos os direitos reservados"
            const SizedBox(height: 20), // Espaçamento inferior
          ],
        ),
      ),
    );
  }
}