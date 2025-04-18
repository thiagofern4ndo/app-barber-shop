import 'package:app_barber_shop/screens/history_screen.dart';
import 'package:app_barber_shop/components/buttons/button_secondary.dart';
import 'package:app_barber_shop/screens/scheduling.dart';
import 'package:app_barber_shop/screens/terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double buttonWidth = size.width * 0.8;
    final double buttonHeight = size.height * 0.065;
    final double fontSizeTitle = size.width * 0.065;
    final double fontSizeEmail = size.width * 0.035;
    final double buttonFontSize = size.width * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressed: () => Navigator.of(context).pop(),
                    size: size.width * 0.1,
                  ),
                  InstagramIconButton(),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Thiago Fernando',
                  style: AppFonts.main.copyWith(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
                Text(
                  'thiagofernando@email.com',
                  style: AppFonts.main.copyWith(
                    fontSize: fontSizeEmail,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.06),
            Column(
              children: [
                CustomButton2(
                  text: 'Gerenciar Reservas',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SchedulingScreen(),
                      ),
                    );
                  },
                  width: buttonWidth,
                  height: buttonHeight,
                  textStyle: AppFonts.main.copyWith(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                CustomButton2(
                  text: 'Histórico de Reservas',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReservationHistoryScreen(), 
                      ),
                    );
                  },
                  width: buttonWidth,
                  height: buttonHeight,
                  textStyle: AppFonts.main.copyWith(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                CustomButton2(
                  text: 'Informações Pessoais',
                  onPressed: () {},
                  width: buttonWidth,
                  height: buttonHeight,
                  textStyle: AppFonts.main.copyWith(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                CustomButton2(
                  text: 'Termos de Uso',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermsScreen()),
                    );
                  },
                  width: buttonWidth,
                  height: buttonHeight,
                  textStyle: AppFonts.main.copyWith(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: const ContactButton(),
            ),
          ],
        ),
      ),
    );
  }
}
