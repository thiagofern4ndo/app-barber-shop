import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor; 

  const CustomButton2({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.backgroundColor, 
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double buttonWidth = width ?? size.width * 0.5;
    final double buttonHeight = height ?? size.height * 0.06;
    final double fontSize = buttonHeight * 0.5;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.background,
          side: BorderSide(
            color: AppColors.primary,
            width: buttonHeight * 0.1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight * 0.4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??
              AppFonts.main.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryText,
              ),
        ),
      ),
    );
  }
}
