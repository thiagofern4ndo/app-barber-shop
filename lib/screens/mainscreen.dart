import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importando o pacote
import 'package:app_barber_shop/widgets/buttons/profile_button.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/text/text_direitos.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileIconButton(),
                  InstagramIconButton(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Spacer(),
            Center(
              child: Image.asset(
                'assets/barber.png',
                width: 250,
                height: 250,
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'Agende seu horário',
              onPressed: () {
                print('Botao pressionado, chamar tela de login quando construida');
              },
              width: 320,
              height: 50,
              color: const Color(0xFF00FFB4),
            ),
            const SizedBox(height: 80),
            ContactButton(
              onPressed: () async {
                final Uri whatsappUrl = Uri.parse('https://wa.me/5581999999999'); 
                if (await canLaunchUrl(whatsappUrl)) { 
                  await launchUrl(whatsappUrl); 
                } else {
                  throw 'Não foi possível abrir o WhatsApp';
                }
              },
            ),
            const SizedBox(height: 20),
            TextWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
