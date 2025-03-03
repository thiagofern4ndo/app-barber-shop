import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    this.obscureText = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF000000),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00FFB4),
          width: 4,
        ),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, 
          fontSize: 22, 
          color: Colors.white,
        ),
        keyboardType: keyboardType, 
        obscureText: obscureText, 
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, 
            fontSize: 22, 
            color: const Color(0xFFB0B0B0), 
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

