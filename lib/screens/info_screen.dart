import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:app_barber_shop/models/booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/screens/confirmation_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AgendamentoInfoPage extends StatelessWidget {
  const AgendamentoInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookingProvider = Provider.of<BookingProvider>(context);

    final verticalSpacing = size.height * 0.018;
    final selectedDate = bookingProvider.selectedDate;
    final formattedDate = selectedDate != null
        ? DateFormat('dd/MM').format(selectedDate)
        : 'N/A'; 

    final double boxWidth = size.width * 0.75;

    // Acessar os preços e formatá-los
    String formattedPrices = bookingProvider.selectedServices
        .map((service) => 'R\$ ${service.price.toStringAsFixed(2).replaceAll('.', ',')}')
        .join(', ');

    return CustomScaffold(
      showBackButton: true,
      showProfileRight: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: size.height * 0.03),
                Center(
                  child: Text(
                    'Informações de Agendamento',
                    style: AppFonts.main.copyWith(
                      fontSize: size.width * 0.065,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Center(
                  child: Column(
                    children: [
                      buildInfoBox(
                        label: 'Profissional:',
                        value: bookingProvider.selectedProfessional ?? 'N/A',
                        width: boxWidth,
                        size: size,
                      ),
                      SizedBox(height: verticalSpacing),
                      buildInfoBox(
                        label: 'Serviço:',
                        value: bookingProvider.selectedServices
                            .map((service) => service.name)
                            .join(', '), 
                        width: boxWidth,
                        size: size,
                      ),
                      SizedBox(height: verticalSpacing),
                      buildInfoBox(
                        label: 'Preço:',
                        value: formattedPrices,
                        width: boxWidth,
                        size: size,
                      ),
                      SizedBox(height: verticalSpacing),
                      buildInfoBox(
                        label: 'Data:',
                        value: formattedDate,
                        width: boxWidth,
                        size: size,
                      ),
                      SizedBox(height: verticalSpacing),
                      buildInfoBox(
                        label: 'Hora:',
                        value: bookingProvider.selectedHour ?? 'N/A',
                        width: boxWidth,
                        size: size,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: 'Confirmar Agendamento',
                    onPressed: () {
                      bookingProvider.confirmBooking(); 

                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 600),
                          pageBuilder: (_, __, ___) => const ConfirmationPage(),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    height: size.height * 0.055,
                    width: size.width * 0.75,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoBox({
    required String label,
    required String value,
    required double width,
    required Size size,
  }) {
    return SizedBox(
      width: width,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.015,
          horizontal: size.width * 0.04,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary, width: 3.5),
        ),
        child: RichText(
          text: TextSpan(
            style: AppFonts.main.copyWith(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: '$label ',
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
