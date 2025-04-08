import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class ContactButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;

  const ContactButton({
    super.key,
    this.width,
    this.height,
    this.color = AppColors.background,
    this.textColor = AppColors.primaryText,
  });

  Future<void> _launchWhatsApp() async {
    const whatsappUrl = 'https://wa.me/5581999999999';
    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      debugPrint('Não foi possível abrir o WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double buttonWidth = width ?? size.width * 0.4;
    final double buttonHeight = height ?? size.height * 0.06;
    final double fontSize = size.width * 0.04;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.015,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: AppColors.primary,
                width: 3,
              ),
            ),
          ),
          onPressed: _launchWhatsApp,
          child: SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: Center(
              child: Text(
                'Contato',
                style: AppFonts.main.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w300,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          'Todos os direitos reservados',
          style: AppFonts.main.copyWith(
            fontSize: size.width * 0.03,
            color: AppColors.secondaryText,
          ),
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}
