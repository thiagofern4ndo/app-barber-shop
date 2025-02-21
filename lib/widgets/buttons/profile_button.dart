import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileIconButton extends StatelessWidget {
  void _navigateToTemporaryPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Tela Temporária'),
          ),
          body: Center(
            child: Text('Aguarde a criação da tela de perfil'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.userCircle, 
        color: const Color(0xFF00FFb4), 
        size: 35, 
      ),
      onPressed: () => _navigateToTemporaryPage(context), 
    );
  }
}

