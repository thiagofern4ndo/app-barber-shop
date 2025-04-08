import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth * 0.85,
          height: screenHeight * 0.075,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.selectedColor,
              width: 4,
            ),
          ),
          child: TextField(
            controller: controller,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.05,
              color: AppColors.primaryText,
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.05,
                color: AppColors.secondaryText,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.015,
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: screenHeight * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Text(
              errorText!,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.035,
                color: AppColors.thirdTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
