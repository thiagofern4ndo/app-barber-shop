import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:google_fonts/google_fonts.dart'; 

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
            const SizedBox(height: 60),

            SizedBox(
              height: 200, 
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Seja bem-vindo ao',
                      style: GoogleFonts.poppins(
                        fontSize: 22, 
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryText,
                      ),
                    ),
                    Text(
                      'Sparta Barber Shop',
                      style: GoogleFonts.poppins(
                        fontSize: 30, 
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary, 
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 220, 
              child: Center(
                child: Image.asset(
                  'assets/barber.png',
                  width: 250,
                  height: 250,
                ),
              ),
            ),

            const SizedBox(height: 60),
            CustomButton(
              text: 'Agende seu horário',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              width: 260,
              height: 45,
              fontSize: 20,
            ),
            const SizedBox(height: 60),
            ContactButton(
              onPressed: () async {
                const whatsappUrl = 'https://wa.me/5581999999999';
                if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                  await launchUrl(Uri.parse(whatsappUrl));
                } else {
                  throw 'Não foi possível abrir o WhatsApp';
                }
              },
            ),
            const SizedBox(height: 5),
            TextWidget(),
          ],
        ),
      ),
    );
  }
}
