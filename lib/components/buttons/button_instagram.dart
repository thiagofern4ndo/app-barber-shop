import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

class InstagramIconButton extends StatelessWidget {
  final String instagramUrl;
  final Color iconColor;
  final double? iconSize;

  const InstagramIconButton({
    super.key,
    this.instagramUrl = 'https://www.instagram.com/seu_perfil_aqui/',
    this.iconColor = AppColors.primary,
    this.iconSize,
  });

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(instagramUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('Não foi possível abrir o link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double responsiveIconSize = iconSize ?? size.width * 0.1;

    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.instagram,
        color: iconColor,
        size: responsiveIconSize,
      ),
      onPressed: _launchURL,
      tooltip: 'Abrir Instagram',
    );
  }
}
