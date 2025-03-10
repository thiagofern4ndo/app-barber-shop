import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class TextWidget extends StatelessWidget {
  final String text; 
  final TextStyle style; 

  const TextWidget({
    Key? key,
    this.text = 'Todos os direitos reservados', 
    this.style = const TextStyle(
      fontSize: 12,
      color: AppColors.secondaryText,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: style.fontSize,
        color: style.color,
      ),
    );
  }
}
