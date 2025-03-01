import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size; // mudei para permitir definir o tamanho do botão
  final Color color; // mesma coisa de cima

  CustomBackButton({
    Key? key,
    required this.onPressed,
    this.size = 40,  // Tamanho padrão é 40 mas agora e mais facilmente customizavel
    this.color = const Color(0xFF00FFB4),  // Cor padrão é a mesma, mas tbm pode ser alterada com mais facilidade e ser for instacianada novamente pode receber novo parametro
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomPaint(
        size: Size(size, size),  // tamanho dinâmico do botão 
        painter: BackArrowPainter(color: color),  // Passa a cor dinamicamente
      ),
      onPressed: onPressed,
    );
  }
}

class BackArrowPainter extends CustomPainter {
  final Color color; // cor da seta, que pode ser personalizada

  BackArrowPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color  // usando a cor personalizada aqui
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(size.width * 0.95, size.height * 0.10)
      ..lineTo(size.width * 0.05, size.height * 0.5)
      ..lineTo(size.width * 0.95, size.height * 0.90);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


