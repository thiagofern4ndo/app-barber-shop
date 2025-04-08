import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class CustomCheckBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final double? width;
  final double? height;
  final double? fontSize;

  const CustomCheckBox({
    super.key,
    required this.text,
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

    // AUMENTA A FONTE APENAS PARA O COMBO (título)
    final double titleFontSize = text == 'Combo: Corte e Barba'
        ? effectiveFontSize * 1.1
        : effectiveFontSize;

    // AUMENTA A FONTE APENAS PARA O COMBO (preço)
    final double priceFontSize = text == 'Combo: Corte e Barba'
        ? effectiveFontSize
        : effectiveFontSize * 0.8;

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
                children: [
                  Flexible(
                    child: Text(
                      text,
                      style: AppFonts.main.copyWith(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getPrice(text),
                    style: AppFonts.main.copyWith(
                      fontSize: priceFontSize,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
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

  String _getPrice(String service) {
    switch (service) {
      case 'Corte':
        return 'R\$ 40,00';
      case 'Corte Infantil':
        return 'R\$ 50,00';
      case 'Barba':
        return 'R\$ 30,00';
      case 'Sobrancelha':
        return 'R\$ 40,00';
      case 'Combo: Corte e Barba':
        return 'R\$ 60,00';
      default:
        return '';
    }
  }
}
