import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardReservas extends StatelessWidget {
  final double dayOffset;
  final double monthOffset;
  final double trashOffset;

  const CardReservas({
    super.key,
    this.dayOffset = 5,
    this.monthOffset = 0,
    this.trashOffset = -5,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
            padding: EdgeInsets.only(left: screenWidth * 0.035),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.055),
                Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
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
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Eduardo',
                  style: AppFonts.main.copyWith(
                    fontSize: 16,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Container(
            width: screenWidth * 0.6,
            height: screenHeight * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.background,
              border: Border.all(color: AppColors.primary, width: 3),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.018),
                          child: Text(
                            'Combo',
                            style: AppFonts.main.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.018),
                          child: Text(
                            'R\$ 70,00',
                            style: AppFonts.main.copyWith(
                              fontSize: 18,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Text(
                          '11:00',
                          style: AppFonts.main.copyWith(
                            fontSize: 18,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.02),
                    child: Stack(
                      children: [
                        Positioned(
                          right: dayOffset,
                          top: screenHeight * 0.03,
                          child: Text(
                            '21',
                            style: AppFonts.main.copyWith(
                              fontSize: 22,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Positioned(
                          right: monthOffset,
                          top: screenHeight * 0.065,
                          child: Text(
                            'Fev',
                            style: AppFonts.main.copyWith(
                              fontSize: 16,
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Positioned(
                          right: trashOffset,
                          top: screenHeight * 0.125,
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
        ],
      ),
    );
  }
}
