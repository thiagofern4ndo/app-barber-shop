import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text; 
  final TextStyle style; 

  // definindo  padrão para o texto e estilo
  const TextWidget({
    Key? key,
    this.text = 'Todos os direitos reservados', 
    this.style = const TextStyle(
      fontSize: 12,
      color: Color(0xFF757575),
      fontFamily: 'Poppins', // Adicionando a fonte como const
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
