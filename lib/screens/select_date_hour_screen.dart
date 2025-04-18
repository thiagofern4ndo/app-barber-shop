import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/buttons/button_secondary.dart';
import 'package:app_barber_shop/components/calendar/carousel_calendar.dart';
import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/models/booking_provider.dart';
import 'package:app_barber_shop/screens/select_date_screen.dart';
import 'package:app_barber_shop/screens/select_professional_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectHourPage extends StatelessWidget {
  const SelectHourPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookingProvider = Provider.of<BookingProvider>(context);
    final selectedDate = bookingProvider.selectedDate;
    final selectedHour = bookingProvider.selectedHour;

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

    void navigateToNextScreen() {
      if (selectedDate != null && selectedHour != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfessionalSelectionScreen(),
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
    }

    return CustomScaffold(
      showBackButton: true,
      showCalendarButton: true,
      onCalendarPressed: () async {
        final DateTime? result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CalendarSelectionScreen(),
          ),
        );
        if (result != null) {
          bookingProvider.setDate(result);
        }
      },
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.015,
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.022),
            Text(
              'Selecione a data',
              style: AppFonts.main.copyWith(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            CarouselCalendar(
              onDateSelected: (date) {
                bookingProvider.setDate(date);
              },
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Selecione um horário',
              style: AppFonts.main.copyWith(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: size.height * 0.018),
            Wrap(
              spacing: size.width * 0.04,
              runSpacing: size.height * 0.011,
              children: hours.map((hour) {
                final bool isSelected = selectedHour == hour;

                return SizedBox(
                  width: size.width * 0.28,
                  height: size.height * 0.055,
                  child: CustomButton2(
                    text: hour,
                    onPressed: () {
                      bookingProvider.setHour(hour);
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
            CustomButton(
              text: 'Continuar',
              onPressed: navigateToNextScreen,
              height: size.height * 0.06,
              width: size.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
