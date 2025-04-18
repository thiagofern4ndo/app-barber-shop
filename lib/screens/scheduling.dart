import 'package:app_barber_shop/models/booking_provider.dart';  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:app_barber_shop/components/cards/card_reservas.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class SchedulingScreen extends StatelessWidget {
  const SchedulingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final reservations = context.watch<BookingProvider>().confirmedBookings;

    return CustomScaffold(
      showProfileRight: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05),
            Text(
              'Agendamentos',
              style: AppFonts.main.copyWith(
                fontSize: width * 0.06,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: height * 0.03),
            if (reservations.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.2),
                child: Text(
                  'Nenhuma reserva ativa',
                  style: AppFonts.main.copyWith(
                    fontSize: width * 0.045,
                    color: AppColors.secondaryText,
                  ),
                ),
              )
            else
              ...reservations.map((reservation) => CardReservas(reservation: reservation)),
          ],
        ),
      ),
    );
  }
}
