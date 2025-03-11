import 'package:app_barber_shop/components/theme/colors.dart';
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
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.background),
          side: MaterialStateProperty.all(BorderSide(
            color: AppColors.primary,
            width: 3,
          )),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
              ),
            ),
          ),
        ),
        onPressed: () => onChanged(!isChecked),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryText,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 05), // Ajusta a distância para a margem direita
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 3,
                ),
                color: AppColors.background,
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      color: AppColors.primary,
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
