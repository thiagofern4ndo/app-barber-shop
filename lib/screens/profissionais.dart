import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';


class ProfessionalSelectionScreen extends StatefulWidget {
  const ProfessionalSelectionScreen({super.key});

  @override
  _ProfessionalSelectionScreenState createState() =>
      _ProfessionalSelectionScreenState();
}

class _ProfessionalSelectionScreenState
    extends State<ProfessionalSelectionScreen> {
  String? selectedProfessional; 


  void selectProfessional(String name) {
    setState(() {
      selectedProfessional = name;
    });
  }


  void navigateToNextScreen() {
    if (selectedProfessional != null) {
    } else {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                  ),
                  InstagramIconButton(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Escolha um profissional',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomButton(
                    text: 'Continuar',
                    onPressed: navigateToNextScreen,
                    height: 40,
                    width: 200,
                  ),
                  const SizedBox(height: 80),
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
                  const SizedBox(height: 20),
                  TextWidget(),
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
    bool isSelected =
        selectedProfessional == name; 

    return GestureDetector(
      onTap: () => onTap(name), 
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: isSelected
              ? const BorderSide(color: AppColors.primary, width: 3)
              : BorderSide.none,
        ),
        color: AppColors.background,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
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
