import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.width = 300, 
    this.height = 60, 
    this.keyboardType = TextInputType.text, 
    this.obscureText = false, String? errorText, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
          fontSize: 22, 
          color: AppColors.primaryText,
        ),
        keyboardType: keyboardType, 
        obscureText: obscureText, 
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, 
            fontSize: 22, 
            color: AppColors.secondaryText, 
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), 
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        textAlignVertical: TextAlignVertical.center, 
      ),
    );
  }
}
