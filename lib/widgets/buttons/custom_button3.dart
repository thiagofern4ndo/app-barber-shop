import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton3 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Alignment alignment;
  final double borderRadius; // Adiciona o parâmetro borderRadius

  var isSelected; // Adiciona o parâmetro isSelected

  CustomButton3({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 300,
    this.height = 40,
    this.fontSize = 18, // Define um valor padrão para fontSize
    this.alignment =
        Alignment.centerLeft, // Define um valor padrão para alignment
    this.borderRadius = 10, // Define um valor padrão para borderRadius
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text.split(':')[0] + ':',
                  style: GoogleFonts.poppins(
                    fontSize: fontSize, // Usa o parâmetro fontSize
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  text.split(':')[1].trim(),
                  style: GoogleFonts.poppins(
                    fontSize: fontSize, // Usa o parâmetro fontSize
                    fontWeight: FontWeight.w500,
                    color: Color(
                        0xFF00FFB4), // Define a cor para o texto após os dois pontos
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
