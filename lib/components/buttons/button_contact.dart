import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width; 
  final double? height; 
  final Color color; 
  final Color textColor; 

  
  static const double defaultWidth = 70;
  static const double defaultHeight = 20;

  ContactButton({
    super.key,
    required this.onPressed,
    this.width = defaultWidth,  
    this.height = defaultHeight,  
    this.color = const Color(0xFF000000), 
    this.textColor = const Color(0xFFFFFFFF),  
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,  
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: const Color(0xFF00FFb4), 
            width: 3,
          ),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: width,  
        height: height,  
        child: Center( 
          child: Text(
            'Contato', 
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: textColor, 
            ),
          ),
        ),
      ),
    );
  }
}
