import 'package:app_barber_shop/models/booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/models/reservation_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardReservas extends StatelessWidget {
  final ReservationModel reservation;
  final bool showTrash;

  const CardReservas({
    super.key,
    required this.reservation,
    this.showTrash = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final widthFactor = screenWidth / 375;
    final cardWidth = screenWidth * 0.9;
    final cardHeight = screenHeight * 0.22;

    final textSize = 16 * widthFactor;
    final smallTextSize = 14 * widthFactor;
    final iconSize = 20 * widthFactor;
    final imageSize = screenWidth * 0.2;
    final containerPadding = screenWidth * 0.03;

    final formattedDay = DateFormat('d', 'pt_BR').format(reservation.date);
    final formattedMonth = DateFormat('MMM', 'pt_BR').format(reservation.date);

    // Verificar se a reserva já passou
    final now = DateTime.now();
    final hourParts = reservation.hour.split(':');
    final scheduledDateTime = DateTime(
      reservation.date.year,
      reservation.date.month,
      reservation.date.day,
      int.parse(hourParts[0]),
      int.parse(hourParts[1]),
    );
    final isPastReservation = scheduledDateTime.isBefore(now);

    return Padding(
      padding: EdgeInsets.all(12 * widthFactor),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20 * widthFactor),
          gradient: const RadialGradient(
            colors: [
              Color(0xFF4A4A4A),
              Color(0xFF222222),
              Color(0xFF0F0F0F),
            ],
            center: Alignment.center,
            radius: 2.2,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: containerPadding),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 * widthFactor),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 3 * widthFactor,
                      ),
                      color: AppColors.primaryText,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20 * widthFactor),
                      child: reservation.professionalImage.isNotEmpty
                          ? Image.asset(
                              reservation.professionalImage,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    reservation.professional,
                    style: AppFonts.main.copyWith(
                      fontSize: textSize,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                child: Container(
                  height: screenHeight * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * widthFactor),
                    color: AppColors.background,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 3 * widthFactor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            top: screenHeight * 0.025,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                child: Text(
                                  reservation.services.map((s) => s.name).join(', '),
                                  style: AppFonts.main.copyWith(
                                    fontSize: 16 * widthFactor,
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                child: Text(
                                  'R\$ ${reservation.totalPrice.toStringAsFixed(2)}',
                                  style: AppFonts.main.copyWith(
                                    fontSize: 16 * widthFactor,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                reservation.hour,
                                style: AppFonts.main.copyWith(
                                  fontSize: 16 * widthFactor,
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.045),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                formattedDay,
                                style: AppFonts.main.copyWith(
                                  fontSize: 22 * widthFactor,
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                formattedMonth,
                                style: AppFonts.main.copyWith(
                                  fontSize: smallTextSize,
                                  color: AppColors.secondaryText,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              // Remover o botão de trash para reservas passadas
                              if (!isPastReservation && showTrash)
                                SizedBox(
                                  width: screenWidth * 0.06,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: FaIcon(
                                      FontAwesomeIcons.trashAlt,
                                      color: AppColors.primaryText,
                                      size: iconSize,
                                    ),
                                    onPressed: () {
                                      final now = DateTime.now();

                                      try {
                                        final hourParts = reservation.hour.split(':');
                                        final scheduledDateTime = DateTime(
                                          reservation.date.year,
                                          reservation.date.month,
                                          reservation.date.day,
                                          int.parse(hourParts[0]),
                                          int.parse(hourParts[1]),
                                        );

                                        final difference = scheduledDateTime.difference(now);

                                        if (difference.inMinutes > 60) {
                                          // Corrigido: Usando 'context.read<BookingProvider>()'
                                          context.read<BookingProvider>().removeReservation(reservation.id);
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Cancelamento não permitido'),
                                              content: const Text(
                                                'Reservas só podem ser canceladas com no mínimo 1 hora de antecedência.',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.of(context).pop(),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Erro ao tentar cancelar a reserva.'),

                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
