// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:app_barber_shop/components/theme/colors.dart';

// class InstagramIconButton extends StatelessWidget {
//   final String instagramUrl = 'https://www.instagram.com/doagustavo12/';

// <<<<<<< HEAD:lib/widgets/buttons/button_instagram.dart
//   // Função para abrir o link
//   _launchURL() async {
//     if (await canLaunch(instagramUrl)) {
//       await launch(instagramUrl);
// =======
//   InstagramIconButton({
//     Key? key,
//     this.instagramUrl = 'https://www.instagram.com/seu_perfil_aqui/',
//     this.iconColor = AppColors.primary,
//     this.iconSize = 40.0,
//   }) : super(key: key);

//   Future<void> _launchURL() async {
//     final Uri url = Uri.parse(instagramUrl);

//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
// >>>>>>> 866f367ae3ec489dae9243738211b368da0998f9:lib/components/buttons/button_instagram.dart
//     } else {
//       print('Não foi possível abrir o link');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: FaIcon(
//         FontAwesomeIcons.instagram,
//         color: const Color(0xFF00FFb4),
//         size: 40,
//       ),
//       onPressed: _launchURL,
//     );
//   }
// }
