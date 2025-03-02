import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckBox extends StatelessWidget {
  String text;
  bool isChecked;
  ValueChanged<bool?> onChanged;
  double width;
  double height;

  CustomCheckBox({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onChanged,
    this.width = 250,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        // substituição de MaterialStateProperty.all por WidgetStateProperty.all pq ele sera descontinuado
        backgroundColor: WidgetStateProperty.all(Color(0xFF000000)), // Alterado para WidgetStateProperty (evitar erro por descontinuação)
        side: WidgetStateProperty.all(BorderSide(
          color: Color(0xFF00FFB4),
          width: 3,
        )), 
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
            ),
          ),
        ), 
      ),
      onPressed: () => onChanged(!isChecked),
      child: Row(
        mainAxisSize: MainAxisSize.min, // ajusta o tamanho do Row ao conteúdo, evitando que ocupe todo o espaço disponível
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF00FFB4),
                width: 3,
              ),
              color: Color(0xFF000000),
            ),
            child: isChecked
                ? Icon(
                    Icons.check,
                    color: Color(0xFF00FFB4),
                    size: 20,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
