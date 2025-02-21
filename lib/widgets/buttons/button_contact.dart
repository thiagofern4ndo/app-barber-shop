import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;

  const ContactButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 110,
    this.height = 27,
    this.color = const Color(0xFF000000), // required Type child,
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
            borderRadius: BorderRadius.circular(10),
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
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
