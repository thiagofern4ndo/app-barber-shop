import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
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



