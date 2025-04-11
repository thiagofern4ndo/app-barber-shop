import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_profile.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final bool showBackButton;
  final bool showProfileLeft;
  final bool showProfileRight;
  final bool showInstagramButton;
  final bool showContactButton;

  const CustomScaffold({
    super.key,
    this.body,
    this.showBackButton = true,
    this.showProfileLeft = false,
    this.showProfileRight = false,
    this.showInstagramButton = false,
    this.showContactButton = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leftWidget;
    if (showProfileLeft) {
      leftWidget = const ProfileIconButton();
    } else if (showBackButton) {
      leftWidget = CustomBackButton(
        onPressed: () => Navigator.of(context).pop(),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leftWidget ?? const SizedBox.shrink(),
                  Row(
                    children: [
                      if (showInstagramButton) const InstagramIconButton(),
                      if (showProfileRight) const ProfileIconButton(),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: body ?? const SizedBox.shrink(),
            ),
            if (showContactButton) const ContactButton(),
          ],
        ),
      ),
    );
  }
}
