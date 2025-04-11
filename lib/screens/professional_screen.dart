import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/buttons/button_profile.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/cards/professional_card.dart';
import 'package:app_barber_shop/data/professionals.dart'; 

class ProfessionalSelectionScreen extends StatefulWidget {
  final List<String> selectedServices;
  final List<double> selectedPrices; // ✅ Adicionado
  final DateTime selectedDate;
  final String selectedHour;

  const ProfessionalSelectionScreen({
    super.key,
    required this.selectedServices,
    required this.selectedPrices, // ✅ Adicionado
    required this.selectedDate,
    required this.selectedHour,
  });

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
        MaterialPageRoute(
          builder: (context) => AgendamentoInfoPage(
            selectedProfessional: selectedProfessional!,
            selectedServices: widget.selectedServices,
            selectedPrices: widget.selectedPrices, // ✅ Adicionado
            selectedDate: widget.selectedDate,
            selectedHour: widget.selectedHour,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione um profissional.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                    ),
                    const ProfileIconButton(),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Escolha um profissional',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: screenWidth * 0.04,
                  mainAxisSpacing: screenHeight * 0.0001,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: professionals.map((professional) {
                    final name = professional['name']!;
                    final imagePath = professional['imagePath']!;
                    return ProfessionalCard(
                      name: name,
                      imagePath: imagePath,
                      isSelected: selectedProfessional == name,
                      onTap: () => selectProfessional(name),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomButton(
                text: 'Continuar',
                onPressed: navigateToNextScreen,
                height: screenHeight * 0.05,
                width: screenWidth * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
