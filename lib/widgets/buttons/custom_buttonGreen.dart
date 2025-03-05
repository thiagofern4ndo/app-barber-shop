import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final double? fontSize;
  final bool isSelected;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 150, // largura do botão
    this.height = 40, // altura do botão
    this.color = const Color(0xFF00FFB4),
    this.fontSize,
    this.isSelected = false, // Inicializa a propriedade isSelected
  });

  double get _computedFontSize => fontSize ?? height * 0.4;

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
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: const Color(0xFF000000),
            fontSize: _computedFontSize, // Usa a propriedade _computedFontSize
            fontWeight: FontWeight.w600,
            shadows: [
              const Shadow(
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