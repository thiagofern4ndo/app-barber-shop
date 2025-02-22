import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
   double width;
   double height;
  final Color color;

   ContactButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 130,
    this.height = 27,
    this.color = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: const Color(0xFF00FFb4),
              width: 3,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
