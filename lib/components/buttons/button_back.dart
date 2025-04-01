import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const CustomBackButton({
    super.key,
    required this.onPressed,
    this.size = 40,
    this.backgroundColor = AppColors.primary,
    this.iconColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.chevron_left, 
            size: size * 1,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
