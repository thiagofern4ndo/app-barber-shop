import 'package:app_barber_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_barber_shop/components/theme/colors.dart';// Importando a página de perfil

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({super.key});

  void _navigateToUserProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserProfilePage(), // Redirecionando para a UserProfilePage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.circleUser,
        color: AppColors.primary,
        size: 37,
      ),
      onPressed: () => _navigateToUserProfile(context),  // Navegando para a página de perfil
    );
  }
}
