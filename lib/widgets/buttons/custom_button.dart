import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 300,
    this.height = 60,
    this.color = const Color(0xFF00FFB4), // Cor padrão #00FFB4
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Corner radius 25
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w600, // SemiBold
            color: Colors.black,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                color: Colors.black,
                blurRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
