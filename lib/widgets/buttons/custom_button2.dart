import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton2 extends StatelessWidget {
<<<<<<< HEAD
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize; // Adiciona o parâmetro fontSize
=======
  String text;
  VoidCallback onPressed;
  double width;
  double height;
  double fontSize;
  final bool isSelected;
>>>>>>> 161796c855ff5e1f1202d8b5b9802146bcbc9460

  CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 300,
    this.height = 60,
    this.fontSize = 20, // Define um valor padrão para fontSize
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.greenAccent : const Color(0xFF000000),
        side: const BorderSide(
          color: Color(0xFF00FFB4),
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
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
>>>>>>> 161796c855ff5e1f1202d8b5b9802146bcbc9460
    );
  }
}
