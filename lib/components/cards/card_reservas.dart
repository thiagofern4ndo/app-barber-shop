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

    final widthFactor = screenWidth / 375;
    final cardWidth = screenWidth * 0.9;
    final cardHeight = screenHeight * 0.22;

    final textSize = 16 * widthFactor;
    final smallTextSize = 14 * widthFactor;
    final iconSize = 20 * widthFactor;
    final imageSize = screenWidth * 0.2;
    final containerPadding = screenWidth * 0.03;

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
                          color: AppColors.primary, width: 3 * widthFactor),
                      color: AppColors.primaryText,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20 * widthFactor),
                      child: Image.asset(
                        'assets/eduardo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Eduardo',
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
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth *
                        0.05),
                child: Container(
                  height: screenHeight * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * widthFactor),
                    color: AppColors.background,
                    border: Border.all(
                        color: AppColors.primary, width: 3 * widthFactor),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.02,
                              top: screenHeight * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.015),
                                child: Text(
                                  'Combo',
                                  style: AppFonts.main.copyWith(
                                    fontSize: 16 * widthFactor,
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.015),
                                child: Text(
                                  'R\$ 70,00',
                                  style: AppFonts.main.copyWith(
                                    fontSize: 16 * widthFactor,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                '11:00',
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
                          padding: EdgeInsets.only(right: screenWidth * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '21',
                                style: AppFonts.main.copyWith(
                                  fontSize: 22 * widthFactor,
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Fev',
                                style: AppFonts.main.copyWith(
                                  fontSize: smallTextSize,
                                  color: AppColors.secondaryText,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              
                              SizedBox(
                                width: screenWidth * 0.06, 
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: FaIcon(
                                    FontAwesomeIcons.trashAlt,
                                    color: AppColors.primaryText,
                                    size: iconSize,
                                  ),
                                  onPressed: () {},
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
