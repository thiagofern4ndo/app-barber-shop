import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileIconButton extends StatelessWidget {
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
      icon: const FaIcon(
        FontAwesomeIcons.circleUser, 
        color: Color(0xFF00FFb4),
        size: 35,
      ),
      onPressed: () => _navigateToTemporaryPage(context),
    );
  }
}

class TemporaryPage extends StatelessWidget {
  const TemporaryPage({Key? key}) : super(key: key);

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
