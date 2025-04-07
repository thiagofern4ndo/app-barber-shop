import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

// ignore: must_be_immutable
class CustomButton2 extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  double width;
  double height;

  CustomButton2({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.background,
        side: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppFonts.main.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
