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
    this.fontSize,    // deixei o fontSize opcional, sem lógica no construtor, porque esse parametro ainda não existe, isso é apenas uma classe não um objeto
  });

  // Criei um getter para calcular o fontSize 

  double get _computedFontSize => fontSize ?? height * 0.4;

    // "_computedFontSize" esse Getter so vai ser chamado quando o widget, no caso o botão for construido for construído 
    // e caso não tenha sido informado nenhum valor para o fontsize

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color), // Atualizei esse Widget pq nas proximas versoes do flutter o "MaterialStateProperty.all" vai ser descontinuado,
          //esse widget é nativo e não depende do material.dart para funcionar
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
            fontSize: _computedFontSize, // Aqui a gente ussa o getter caso seja necessario
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

