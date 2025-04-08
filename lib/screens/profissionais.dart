import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/screens/servicos.dart';



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
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServicoScreen()),
    );
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
                    imageUrl: 'assets/antonio.png',
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
                  ),
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
      child: Column(
        children: [
          Container(
            width: 120, 
            height: 120, 
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 3)
                  : null,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrl,
                width: 120, 
                height: 120, 
                fit: BoxFit.cover,
              ),
            ),
          ),
            const SizedBox(height: 5),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
       ),
     );
  }
}
