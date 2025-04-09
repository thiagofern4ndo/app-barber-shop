import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/screens/agendamento_info_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';

class ProfessionalSelectionScreen extends StatefulWidget {
  final List<String> selectedServices;
  final DateTime selectedDate;
  final String selectedHour;

  const ProfessionalSelectionScreen({
    super.key,
    required this.selectedServices,
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
          builder: (context) => AgendamentoInfoPage( // ✅ mudou pra tela final
            selectedProfessional: selectedProfessional!,
            selectedServices: widget.selectedServices,
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
                  children: [
                    buildProfessionalCard('Paula', 'assets/paula.png'),
                    buildProfessionalCard('Carlos', 'assets/carlos.png'),
                    buildProfessionalCard('Eduardo', 'assets/eduardo.png'),
                    buildProfessionalCard('Maria', 'assets/maria.png'),
                    buildProfessionalCard('Paulo', 'assets/paulo.png'),
                    buildProfessionalCard('Antonio', 'assets/antonio.png'),
                  ],
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

  Widget buildProfessionalCard(String name, String imagePath) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSelected = selectedProfessional == name;

    return GestureDetector(
      onTap: () => selectProfessional(name),
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.3,
            height: screenWidth * 0.3,
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 3)
                  : null,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
