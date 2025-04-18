import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:app_barber_shop/components/cards/card_reservas.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class SchedulingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return CustomScaffold(
      showProfileRight: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Height * 0.05), 
            Text(
              'Agendamentos',
              style: AppFonts.main.copyWith(
                fontSize: Width * 0.06, 
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: Height * 0.03), 
            CardReservas(),
          ],
        ),
      ),
    );
  }
}