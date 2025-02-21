import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final double width;
  final double height;

  const CustomCheckBox({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onChanged,
    this.width = 250,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
<<<<<<< HEAD
          backgroundColor: Colors.black,
=======
          backgroundColor: Color(0xFF000000),
>>>>>>> c24a562da897b5bdcd30b0731afcf76c302c2110
          side: const BorderSide(
            color: Color(0xFF00FFB4),
            width: 3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
            ),
          ),
        ),
        onPressed: () => onChanged(!isChecked),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
<<<<<<< HEAD
              margin: const EdgeInsets.only(left: 10), // Deslocando o círculo para a direita
=======
              margin: const EdgeInsets.only(left: 10),
>>>>>>> c24a562da897b5bdcd30b0731afcf76c302c2110
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF00FFB4),
                  width: 3,
                ),
<<<<<<< HEAD
                color: Colors.black,
=======
                color: Color(0xFF000000),
>>>>>>> c24a562da897b5bdcd30b0731afcf76c302c2110
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
      ),
    );
  }
}



