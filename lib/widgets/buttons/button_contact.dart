import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;

  static const double defaultWidth = 70;
  static const double defaultHeight = 20;

  ContactButton({
    super.key,
    required this.onPressed,
    this.width = 110,
    this.height = 27,
    this.color = const Color(0xFF000000), // required Type child,
    this.textColor = const Color(0xFF00FFB4), required String text,
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
          'Contato',
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
