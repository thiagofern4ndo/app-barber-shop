import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/data/services.dart';

class CustomCheckBox extends StatelessWidget {
  final Service service;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final double? width;
  final double? height;
  final double? fontSize;

  const CustomCheckBox({
    super.key,
    required this.service,
    required this.isChecked,
    required this.onChanged,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double boxWidth = width ?? screenSize.width * 0.8;
    final double boxHeight = height ?? screenSize.height * 0.07;
    final double effectiveFontSize = fontSize ?? screenSize.width * 0.05;

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
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      service.name,
                      style: AppFonts.main.copyWith(
                        fontSize: effectiveFontSize,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryText,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'R\$: ${service.price.toStringAsFixed(2)}',
                    style: AppFonts.main.copyWith(
                      fontSize: screenSize.width * 0.045,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
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
