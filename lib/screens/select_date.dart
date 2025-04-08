import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/calendar/calendar_user.dart';
import 'package:app_barber_shop/screens/select_time.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class CalendarSelectionScreen extends StatefulWidget {
  const CalendarSelectionScreen({super.key});

  @override
  State<CalendarSelectionScreen> createState() =>
      _CalendarSelectionScreenState();
}

class _CalendarSelectionScreenState extends State<CalendarSelectionScreen> {
  DateTime? _selectedDate;

  void _handleDateSelection(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _handleContinue() {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecione uma data para continuar.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectHourPage(),
      ),
    );
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.065,
                vertical: screenHeight * 0.025,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBackButton(onPressed: _goBack),
                          const ProfileIconButton(),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.07),
                      Text(
                        "Selecione uma Data",
                        style: AppFonts.main.copyWith(
                          fontSize: screenWidth * 0.065,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      CustomCalendar(aoSelecionarDia: _handleDateSelection),
                      const Spacer(),
                      SizedBox(height: screenHeight * 0.07),
                      Center(
                        child: CustomButton(
                          text: 'Continuar',
                          onPressed: _handleContinue,
                          width: screenWidth * 0.57, // ↔️ ajuste aqui
                          height: screenHeight * 0.06, // ↕️ ajuste aqui
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.07),
                      SizedBox(
                        height: screenHeight * 0.2, // ajuste aqui como quiser
                        child: ContactButton(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
