import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramIconButton extends StatelessWidget {
  final String instagramUrl = 'https://www.instagram.com/seu_perfil_aqui/'; // Substitua pelo link do seu perfil

  // Função para abrir o link
  _launchURL() async {
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      throw 'Não foi possível abrir o link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.instagram, // Ícone do Instagram
        color: const Color(0xFF00FFb4), // Customizando a cor para a paleta do seu app
        size: 40, // Tamanho do ícone
      ),
      onPressed: _launchURL, // Ao clicar, abre o link
    );
  }
}