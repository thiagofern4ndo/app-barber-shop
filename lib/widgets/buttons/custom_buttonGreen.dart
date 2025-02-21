import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
<<<<<<< HEAD:lib/widgets/buttons/custom_button.dart
    this.width = 300,
    this.height = 60,
    this.color = const Color(0xFF00FFB4),
=======
    this.width = 150,// largura do botão 
    this.height = 40,// altura do botão
    this.color = const Color(0xFF00FFB4), 
>>>>>>> b20d51514a52df4c6b0595bb2d45e0be5a775669:lib/widgets/buttons/custom_buttonGreen.dart
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
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
<<<<<<< HEAD:lib/widgets/buttons/custom_button.dart
            fontSize: 30,
            fontWeight: FontWeight.w600,
=======
            fontSize: 15, // tamanho da fonte
            fontWeight: FontWeight.w600, 
>>>>>>> b20d51514a52df4c6b0595bb2d45e0be5a775669:lib/widgets/buttons/custom_buttonGreen.dart
            color: Color(0xFF000000),
            shadows: [
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
