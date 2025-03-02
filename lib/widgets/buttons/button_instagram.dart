import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramIconButton extends StatelessWidget {
  final String instagramUrl;
  final Color iconColor;
  final double iconSize;

  // melhorei a construção para deixar os parâmetros flexíveis
  InstagramIconButton({
    Key? key,
    this.instagramUrl = 'https://www.instagram.com/seu_perfil_aqui/', 
    this.iconColor = const Color(0xFF00FFb4), // coloquei a cor pra cá
    this.iconSize = 40.0, // Tamanho padrão
  }) : super(key: key);

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(instagramUrl); // Usando Uri e não uma String, uma classe abstrata do dart ja pronta para trabalhar com url

    if (await canLaunchUrl(url)) { // Usando canLaunchUrl em vez de canLaunch pq e o canLauch foi descontinuado
      await launchUrl(url); // Usando launchUrl em vez de launch pelo mesmo motivo acima
    } else {
      // informe simples para o usuario, depois podemos adicionar tratamento de erro
      print('Não foi possível abrir o link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.instagram,
        color: iconColor, // cor personalizada que vem do construtor a inves de adiconar a cor aqui, tonar o widget mais personalizavel
        size: iconSize, // tamanho personalizado, pelo mesmo motivo
      ),
      onPressed: _launchURL, // usa função de abrir o link
    );
  }
}

