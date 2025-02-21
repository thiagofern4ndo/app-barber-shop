import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomPaint(
        size: Size(40, 40),  
        painter: BackArrowPainter(),
      ),
      onPressed: onPressed,
    );
  }
}

class BackArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF00FFB4)
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


