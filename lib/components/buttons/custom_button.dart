import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color color;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color = AppColors.primary,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double buttonWidth = width ?? size.width * 0.8;
    final double buttonHeight = height ?? size.height * 0.07;
    final double textSize = fontSize ?? buttonHeight * 0.4;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonHeight * 0.25),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppFonts.main.copyWith(
            fontSize: textSize,
            fontWeight: FontWeight.w600,
            color: AppColors.background,
            shadows: [
              Shadow(
                offset: Offset(buttonHeight * 0.02, buttonHeight * 0.02),
                color: AppColors.background,
                blurRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
