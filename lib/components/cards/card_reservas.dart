import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardReservas extends StatelessWidget {
  final double dayOffset;
  final double monthOffset;
  final double trashOffset;

  const CardReservas({
    super.key,
    this.dayOffset = 0,
    this.monthOffset = 0,
    this.trashOffset = -10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: RadialGradient(
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
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primary, width: 3),
                    color: AppColors.primaryText,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/eduardo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Eduardo',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 250,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.background,
                border: Border.all(color: AppColors.primary, width: 3),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              'Combo',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              'R\$ 70,00',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              '11:00',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, top: 0),
                      child: Stack(
                        children: [
                          Positioned(
                            right: dayOffset,
                            top: 25,
                            child: Text(
                              '21',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Positioned(
                            right: monthOffset,
                            top: 55,
                            child: Text(
                              'Fev',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: AppColors.secondaryText,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Positioned(
                            right: trashOffset,
                            top: 95,
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: FaIcon(
                                  FontAwesomeIcons.trashAlt,
                                  color: AppColors.primaryText,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
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
        ],
      ),
    );
  }
}
