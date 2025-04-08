import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? size;
  final Color backgroundColor;
  final Color iconColor;

  const CustomBackButton({
    super.key,
    required this.onPressed,
    this.size,
    this.backgroundColor = AppColors.primary,
    this.iconColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double buttonSize = size ?? screenSize.width * 0.1;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(buttonSize / 2),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.chevron_left,
            size: buttonSize * 0.9,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
