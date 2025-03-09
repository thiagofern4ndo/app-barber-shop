import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 300,
    this.height = 60,
    this.color = const Color(0xFF00FFB4),
    this.fontSize,
  });

  double get _computedFontSize => fontSize ?? height * 0.4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: _computedFontSize,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF000000),
            shadows: const [
              Shadow(
                offset: Offset(1, 1),
                color: Color(0xFF000000),
                blurRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
