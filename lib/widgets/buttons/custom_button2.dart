import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton2 extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  double width;
  double height;

  CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 300,
    this.height = 60,
    this.fontSize = 20, // Define um valor padrão para fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF000000),
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
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
