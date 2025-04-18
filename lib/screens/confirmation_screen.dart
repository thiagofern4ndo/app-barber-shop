import 'package:app_barber_shop/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutBack,
    );

    _scaleController.forward();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_fadeController);

    Future.delayed(const Duration(seconds: 3), () {
      _fadeController.forward(); 
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double verticalSpacing = size.height * 0.02;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Image.asset(
                  'assets/logo.png',
                  width: size.width * 0.25,
                ),
                SizedBox(height: verticalSpacing),
                Text(
                  'Agendamento Confirmado!',
                  style: AppFonts.main.copyWith(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: verticalSpacing),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Icon(
                    Icons.check_rounded,
                    color: AppColors.primary,
                    size: size.width * 0.58,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
