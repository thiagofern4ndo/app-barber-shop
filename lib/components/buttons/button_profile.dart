import 'package:app_barber_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({super.key});

  void _navigateToUserProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.09;

    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.circleUser,
        color: AppColors.primary,
        size: iconSize,
      ),
      onPressed: () => _navigateToUserProfile(context),
    );
  }
}

