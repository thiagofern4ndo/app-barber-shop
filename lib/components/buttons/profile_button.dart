import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({super.key});

  void _navigateToTemporaryPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TemporaryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.circleUser,
        color: AppColors.primary,
        size: 35,
      ),
      onPressed: () => _navigateToTemporaryPage(context),
    );
  }
}

class TemporaryPage extends StatelessWidget {
  const TemporaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Temporária'),
      ),
      body: const Center(
        child: Text('Aguarde a criação da tela de perfil'),
      ),
    );
  }
}
