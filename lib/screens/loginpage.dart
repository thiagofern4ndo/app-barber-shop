import 'package:app_barber_shop/screens/register.dart';
import 'package:app_barber_shop/screens/select_services.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/screens/recoverpass.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  bool _validateFields() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    bool hasErrors = false;

    if (_emailController.text.isEmpty) {
      _emailError = 'Por favor, insira um email';
      hasErrors = true;
    }

    if (_passwordController.text.length < 6) {
      _passwordError = 'A senha deve ter pelo menos 6 caracteres';
      hasErrors = true;
    }

    setState(() {});
    return !hasErrors;
  }

  void _submit() {
    if (!_validateFields()) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ServicoScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontScale = size.width * 0.0025;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBackButton(onPressed: () => Navigator.maybePop(context)),
                        InstagramIconButton(),
                      ],
                    ),
                    SizedBox(height: size.height * 0.08),
                    Text(
                      'Entre',
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ou',
                          style: TextStyle(
                            fontSize: size.width * 0.065,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                            );
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              fontSize: size.width * 0.075,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Expanded(
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              if (_emailError != null)
                                Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.01),
                                  child: Text(
                                    _emailError!,
                                    style: TextStyle(
                                      color: AppColors.thirdTextColor,
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ),
                              SizedBox(height: size.height * 0.04),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Senha',
                                obscureText: true,
                              ),
                              if (_passwordError != null)
                                Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.01),
                                  child: Text(
                                    _passwordError!,
                                    style: TextStyle(
                                      color: AppColors.thirdTextColor,
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ),
                              SizedBox(height: size.height * 0.04),
                              CustomButton(
                                text: 'Entrar',
                                onPressed: _submit,
                                width: size.width * 0.48,
                                height: size.height * 0.06,
                                fontSize: size.width * 0.05,
                              ),
                              SizedBox(height: size.height * 0.03),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RecoverPassPage()),
                                  );
                                },
                                child: Text(
                                  'Esqueceu a senha?',
                                  style: GoogleFonts.poppins(
                                    fontSize: size.width * 0.04,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
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
