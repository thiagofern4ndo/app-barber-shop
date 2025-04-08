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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(onPressed: () {
                    Navigator.pop(context);
                  }),
                  const ProfileIconButton(),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Selecione um horário',
                style: AppFonts.main.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2.5,
                  children: hours.map((hour) {
                    return CustomButton2(
                      text: hour,
                      onPressed: () {
                        setState(() {
                          selectedHour = hour;
                        });
                      },
                      width: double.infinity,
                      height: 50,
                      key: ValueKey(hour),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
              ContactButton(),
            ],
          ),
        ),
      ),
    );
  }
}
