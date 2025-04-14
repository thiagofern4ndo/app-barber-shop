import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class CalendarIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CalendarIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.date_range_sharp,
        color: AppColors.primary,
      ),
      iconSize: 37,
      onPressed: onPressed,
    );
  }
}
