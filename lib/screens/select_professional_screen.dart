import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/models/booking_provider.dart';
import 'package:app_barber_shop/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/cards/professional_card.dart';
import 'package:app_barber_shop/data/professionals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfessionalSelectionScreen extends StatelessWidget {
  const ProfessionalSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookingProvider = Provider.of<BookingProvider>(context);
    final selectedProfessional = bookingProvider.currentBooking.selectedProfessional;

    void navigateToNextScreen() {
      if (selectedProfessional != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AgendamentoInfoPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, selecione um profissional.')),
        );
      }
    }

    return CustomScaffold(
      showBackButton: true,
      showProfileRight: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              Text(
                'Escolha um profissional',
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.03),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: size.width * 0.04,
                mainAxisSpacing: size.height * 0.02,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: professionals.map((professional) {
                  final name = professional['name']!;
                  final imagePath = professional['imagePath']!;
                  return ProfessionalCard(
                    name: name,
                    imagePath: imagePath,
                    isSelected: selectedProfessional == name,
                    onTap: () {
                      bookingProvider.setProfessional(name); 
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: size.height * 0.03),
              CustomButton(
                text: 'Continuar',
                onPressed: navigateToNextScreen,
                height: size.height * 0.06,
                width: size.width * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
