import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
   String text = 'Todos os direitos reservados'; 
   TextStyle style = GoogleFonts.poppins(
fontSize: 12,
color: Color(0xFF757575), 
  );
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}