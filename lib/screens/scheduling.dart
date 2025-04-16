import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:app_barber_shop/components/cards/card_reservas.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class SchedulingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showProfileRight: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            SizedBox(height: 50),// Espaçamento entre o topo e o título
          Text(
             'Agendamentos',
              style: AppFonts.main.copyWith(
              fontSize: 24, 
              color: AppColors.primaryText, 
                ),
              ),
            SizedBox(height: 30), // Espaçamento entre o título e o card
            CardReservas()
          ],
        ),
      ),
    );
  }
}