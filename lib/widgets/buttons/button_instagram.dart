import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramIconButton extends StatelessWidget {
  final String instagramUrl;
  final Color iconColor;
  final double iconSize;

  InstagramIconButton({
    Key? key,
    this.instagramUrl = 'https://www.instagram.com/seu_perfil_aqui/',
    this.iconColor = const Color(0xFF00FFb4),
    this.iconSize = 40.0,
  }) : super(key: key);
  Future<void> _launchURL() async {
    final Uri url = Uri.parse(instagramUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Não foi possível abrir o link');
    }
  }
  @override
  
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.instagram,
        color: iconColor,
        size: iconSize,
      ),
      onPressed: _launchURL,
    );
  }
}
