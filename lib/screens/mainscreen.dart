import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/theme/fonts.dart'; 

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileIconButton(),
                        InstagramIconButton(),
                      ],
                    ),

                    SizedBox(height: size.height * 0.05),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Seja bem-vindo ao',
                          style: AppFonts.main.copyWith(
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryText,
                          ),
                        ),
                        Text(
                          'Sparta Barber Shop',
                          style: AppFonts.main.copyWith(
                            fontSize: size.width * 0.075,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.08),

                    SizedBox(
                      height: size.height * 0.28,
                      child: Image.asset(
                        'assets/barber.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const Spacer(),

                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: 'Agende seu horário',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        width: size.width * 0.7,
                        height: size.height * 0.065,
                        fontSize: size.width * 0.050,
                      ),
                    ),

                    SizedBox(height: size.height * 0.06),

                    SizedBox(
                      height: size.height * 0.18,
                      child: ContactButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
