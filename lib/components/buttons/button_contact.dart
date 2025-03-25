// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:app_barber_shop/components/theme/colors.dart';

// class ContactButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final double? width;
//   final double? height;
//   final Color color;
//   final Color textColor;

//   static const double defaultWidth = 70;
//   static const double defaultHeight = 20;

//   ContactButton({
//     super.key,
//     required this.onPressed,
// <<<<<<< HEAD:lib/widgets/buttons/button_contact.dart
//     this.width = 110,
//     this.height = 27,
//     this.color = const Color(0xFF000000), // required Type child,
//     this.textColor = const Color(0xFF00FFB4), required String text,
// =======
//     this.width = defaultWidth,
//     this.height = defaultHeight,
//     this.color = AppColors.background,
//     this.textColor = AppColors.primaryText,
// >>>>>>> 866f367ae3ec489dae9243738211b368da0998f9:lib/components/buttons/button_contact.dart
//   });

//   @override
//   Widget build(BuildContext context) {
// <<<<<<< HEAD:lib/widgets/buttons/button_contact.dart
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//             side: BorderSide(
//               color: const Color(0xFF00FFb4),
//               width: 3,
//             ),
//           ),
//         ),
//         onPressed: onPressed,
//         child: Text(
//           'Contato',
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             fontWeight: FontWeight.w300,
//             color: const Color(0xFFFFFFFF),
// =======
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           side: BorderSide(
//             color: AppColors.primary,
//             width: 3,
//           ),
//         ),
//       ),
//       onPressed: onPressed,
//       child: SizedBox(
//         width: width,
//         height: height,
//         child: Center(
//           child: Text(
//             'Contato',
//             style: GoogleFonts.poppins(
//               fontSize: 15,
//               fontWeight: FontWeight.w300,
//               color: textColor,
//             ),
// >>>>>>> 866f367ae3ec489dae9243738211b368da0998f9:lib/components/buttons/button_contact.dart
//           ),
//         ),
//       ),
//     );
//   }
// }
