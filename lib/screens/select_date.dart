import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/calendar/calendar_user.dart';
import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:app_barber_shop/screens/select_time.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarSelectionScreen extends StatefulWidget {
  const CalendarSelectionScreen({super.key});

  @override
  State<CalendarSelectionScreen> createState() => _CalendarSelectionScreenState();
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

  void _handleContact() {
    // lógica do botão contato
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      const SizedBox(height: 30),
                      Text(
                        "Selecione uma Data",
                        style: AppFonts.main.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      CustomCalendar(aoSelecionarDia: _handleDateSelection),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: 'Continuar',
                        onPressed: _handleContinue,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 20),
                      ContactButton(
                        onPressed: () async {
                          const whatsappUrl = 'https://wa.me/5581999999999';
                          if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                            await launchUrl(Uri.parse(whatsappUrl));
                          } else {
                            debugPrint('Não foi possível abrir o WhatsApp');
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      TextWidget(),
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
