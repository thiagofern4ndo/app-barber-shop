import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

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
    this.width = 300,
    this.height = 60,
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
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
