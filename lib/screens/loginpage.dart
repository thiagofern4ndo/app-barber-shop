import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:app_barber_shop/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/screens/profissionais.dart';
import 'package:app_barber_shop/screens/recoverpass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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

    // A senha precisa ter pelo menos 6 caracteres
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
      MaterialPageRoute(builder: (context) => const ProfessionalSelectionScreen()),
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(onPressed: () => Navigator.maybePop(context)),
                  InstagramIconButton(),
                ],
              ),
            ),
            const SizedBox(height: 90),
            Column(
              children: [
                Text(
                  'Entre',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ou',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primaryText),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => RegisterPage())),
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        if (_emailError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _emailError!,
                              style: TextStyle(color: AppColors.thirdTextColor),
                            ),
                          ),
                        const SizedBox(height: 32),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Senha',
                          obscureText: true,
                        ),
                        if (_passwordError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _passwordError!,
                              style: TextStyle(color: AppColors.thirdTextColor),
                            ),
                          ),
                        const SizedBox(height: 50),
                        CustomButton(
                          text: 'Entrar',
                          onPressed: _submit,
                          width: 180,
                          height: 45,
                          fontSize: 22,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => RecoverPassPage())),
                          child: Text(
                            'Esqueceu a senha?',
                            style: GoogleFonts.poppins(fontSize: 16, color: AppColors.primaryText),
                          ),
                        ),
                        const SizedBox(height: 60),
                        ContactButton(
                          onPressed: () async {
                            const whatsappUrl = 'https://wa.me/5581999999999';
                            if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                              await launchUrl(Uri.parse(whatsappUrl));
                            } else {
                              debugPrint('Não foi possível abrir o WhatsApp');
                            }
                          },
                        ),
                        const SizedBox(height: 5),
                        TextWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
