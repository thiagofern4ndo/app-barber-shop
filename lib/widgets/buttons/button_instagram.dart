import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramIconButton extends StatelessWidget {
  final String instagramUrl = 'https://www.instagram.com/doagustavo12/';

  // Função para abrir o link
  _launchURL() async {
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      print('Não foi possível abrir o link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.instagram,
        color: const Color(0xFF00FFb4),
        size: 40,
      ),
      onPressed: _launchURL,
    );
  }
}
