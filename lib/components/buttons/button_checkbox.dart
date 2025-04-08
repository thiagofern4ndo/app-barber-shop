import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class CustomCheckBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final double? width;
  final double? height;

  const CustomCheckBox({
    super.key,
    required this.text,
    required this.isChecked,
    required this.onChanged,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double boxWidth = width ?? screenSize.width * 0.8;
    final double boxHeight = height ?? screenSize.height * 0.07;

    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.background),
          side: WidgetStateProperty.all(
            BorderSide(
              color: AppColors.primary,
              width: 3,
            ),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
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
                  fontSize: screenSize.width * 0.05,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: boxHeight * 0.6,
                height: boxHeight * 0.6,
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
                        size: boxHeight * 0.4,
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
