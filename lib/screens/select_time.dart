import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/custom_button2.dart';
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class SelectHourPage extends StatefulWidget {
  const SelectHourPage({super.key});

  @override
  State<SelectHourPage> createState() => _SelectHourPageState();
}

class _SelectHourPageState extends State<SelectHourPage> {
  String? selectedHour;

  final List<String> hours = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double spacing = size.height * 0.02;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                  const ProfileIconButton(),
                ],
              ),
              SizedBox(height: spacing * 2),
              Text(
                'Selecione um horário',
                style: AppFonts.main.copyWith(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: spacing * 1.9),

              // Grade de horários
              Wrap(
                spacing: size.width * 0.04,
                runSpacing: spacing,
                children: hours.map((hour) {
                  return SizedBox(
                    width: size.width * 0.4,
                    height: size.height * 0.065,
                    child: CustomButton2(
                      text: hour,
                      onPressed: () {
                        setState(() {
                          selectedHour = hour;
                        });
                      },
                      key: ValueKey(hour),
                    ),
                  );
                }).toList(),
              ),

              // Espaço antes do botão continuar
              SizedBox(height: size.height * 0.05),

              // Botão continuar
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.06,
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {},
                ),
              ),

              SizedBox(height: spacing),

              // Botão de contato
              SizedBox(
                height: size.height * 0.2,
                child: ContactButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
