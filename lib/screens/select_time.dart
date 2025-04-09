import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/custom_button2.dart';
import 'package:app_barber_shop/components/calendar/carousel_calendar.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/screens/profissionais.dart';
import 'package:app_barber_shop/screens/select_date.dart';
import 'package:flutter/material.dart';

class SelectHourPage extends StatefulWidget {
  final List<String> selectedServices;

  const SelectHourPage({
    super.key,
    required this.selectedServices, required DateTime selectedDate, required String selectedHour, required String selectedProfessional,
  });

  @override
  State<SelectHourPage> createState() => _SelectHourPageState();
}

class _SelectHourPageState extends State<SelectHourPage> {
  String? selectedHour;
  DateTime? selectedDate;

  final List<String> hours = [
    '08:00',
    '08:50',
    '09:40',
    '10:30',
    '11:20',
    '12:10',
    '13:00',
    '13:50',
    '14:40',
    '15:30',
    '16:20',
    '17:10',
    '18:00',
    '18:50',
    '19:40',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double spacing = size.height * 0.01;

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
                  IconButton(
                    icon: const Icon(Icons.date_range_sharp,
                        color: AppColors.primary),
                    iconSize: 35,
                    onPressed: () async {
                      final DateTime? result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CalendarSelectionScreen(),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          selectedDate = result;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: spacing * 2),
              Text(
                'Selecione a data',
                style: AppFonts.main.copyWith(
                  fontSize: size.width * 0.055,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: spacing),
              CarouselCalendar(
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
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
              Wrap(
                spacing: size.width * 0.04,
                runSpacing: spacing,
                children: hours.map((hour) {
                  final bool isSelected = selectedHour == hour;

                  return SizedBox(
                    width: size.width * 0.28,
                    height: size.height * 0.055,
                    child: CustomButton2(
                      text: hour,
                      onPressed: () {
                        setState(() {
                          selectedHour = hour;
                        });
                      },
                      key: ValueKey(hour),
                      backgroundColor:
                          isSelected ? AppColors.primary : AppColors.background,
                      textStyle: AppFonts.main.copyWith(
                        fontSize: size.width * 0.050,
                        fontWeight: FontWeight.w900,
                        color: isSelected
                            ? AppColors.background
                            : AppColors.primaryText,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.06,
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {
                    if (selectedDate != null && selectedHour != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfessionalSelectionScreen(
                            selectedServices: widget.selectedServices,
                            selectedDate: selectedDate!,
                            selectedHour: selectedHour!,
                          ),
                        ),
                      );
                    } else {
                      String message = '';
                      if (selectedDate == null && selectedHour == null) {
                        message = 'Por favor, selecione a data e o horário.';
                      } else if (selectedDate == null) {
                        message = 'Por favor, selecione uma data.';
                      } else {
                        message = 'Por favor, selecione um horário.';
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
