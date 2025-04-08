import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/custom_button2.dart';
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/calendar/carousel_calendar.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:flutter/material.dart';

class SelectHourPage extends StatefulWidget {
  const SelectHourPage({super.key});

  @override
  State<SelectHourPage> createState() => _SelectHourPageState();
}

class _SelectHourPageState extends State<SelectHourPage> {
  String? selectedHour;
  DateTime selectedDate = DateTime.now();

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              // Ajuste o espaçamento aqui, para evitar overflow
              SizedBox(height: spacing),
              Text(
                'Selecione uma data',
                style: AppFonts.main.copyWith(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),

              SizedBox(height: spacing),
              CarouselCalendar(
                onDaySelected: (day) {
                  setState(() {
                    selectedDate = day;
                  });
                },
                aoSelecionarDia: (DateTime) {},
              ),

              SizedBox(height: spacing),
              Text(
                'Selecione um horário',
                style: AppFonts.main.copyWith(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),

              SizedBox(height: spacing),
              Wrap(
                spacing: size.width * 0.03,
                runSpacing: spacing * 0.8,
                children: hours.map((hour) {
                  final isSelected = selectedHour == hour;
                  return CustomButton2(
                    text: hour,
                    onPressed: () {
                      setState(() {
                        selectedHour = hour;
                      });
                    },
                    isSelected: isSelected,
                    width: size.width * 0.28,
                    height: size.height * 0.055,
                    key: ValueKey(hour),
                  );
                }).toList(),
              ),

              // Ajuste o tamanho do botão "Continuar"
              SizedBox(height: size.height * 0.05),
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.06,
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {},
                ),
              ),

              SizedBox(height: spacing),
              // Ajuste para garantir que o botão de contato não sobreponha
              SizedBox(
                height: size.height * 0.2,
                child: const ContactButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
