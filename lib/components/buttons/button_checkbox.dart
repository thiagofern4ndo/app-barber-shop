import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/fonts.dart'; 

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  String text;
  bool isChecked;
  ValueChanged<bool?> onChanged;
  double width;
  double height;

  CustomCheckBox({
    super.key,
    required this.text,
    required this.isChecked,
    required this.onChanged,
    this.width = 280,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.background),
          side: WidgetStateProperty.all(BorderSide(
            color: AppColors.primary,
            width: 3,
          )),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
          ),
        ),
        onPressed: () => onChanged(!isChecked),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppFonts.main.copyWith( 
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 28,
                height: 28,
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
                        size: 18,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
