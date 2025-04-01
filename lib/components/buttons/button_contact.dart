import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;

  static const double defaultWidth = 70;
  static const double defaultHeight = 20;

  ContactButton({
    super.key,
    required this.onPressed,
    this.width = defaultWidth,
    this.height = defaultHeight,
    this.color = AppColors.background,
    this.textColor = AppColors.primaryText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: AppColors.primary,
            width: 3,
          ),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            'Contato',
            style: AppFonts.main.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
