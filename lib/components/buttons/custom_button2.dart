import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Alignment alignment;
  final double borderRadius; // Adiciona o parâmetro borderRadius

  var isSelected; // Adiciona o parâmetro isSelected

  CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 120,
    this.height = 40,
    this.fontSize = 15, // Define um valor padrão para fontSize
    this.alignment =
        Alignment.centerLeft, // Define um valor padrão para alignment
    this.borderRadius = 20, // Define um valor padrão para borderRadius
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
            borderRadius: BorderRadius.circular(
                borderRadius), // Usa o parâmetro borderRadius
          ),
        ),
        onPressed: onPressed,
        child: Align(
          alignment: alignment, // Usa o parâmetro alignment
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10), // Adiciona padding à esquerda
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: fontSize, // Usa o parâmetro fontSize
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
