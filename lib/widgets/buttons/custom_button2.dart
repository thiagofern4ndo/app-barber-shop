import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;

  var isSelected; // Adiciona o parâmetro fontSize

  CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 120,
    this.height = 40,
    this.fontSize = 15, // Define um valor padrão para fontSize
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          side: const BorderSide(
            color: Color(0xFF00FFB4),
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: fontSize, // Usa o parâmetro fontSize
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
