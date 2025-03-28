import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/screens/loginpage.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  String? _fullNameError;
  String? _emailError;
  String? _phoneError;
  String? _passwordError;
  String? _confirmPasswordError;

  bool _acceptTerms = false;

  bool _validateFields() {
    bool hasErrors = false;

    if (_fullNameController.text.isEmpty) {
      _fullNameError = 'Por favor, insira seu nome completo';
      hasErrors = true;
    }

    if (_emailController.text.isEmpty) {
      _emailError = 'Por favor, insira um email válido';
      hasErrors = true;
    }

    if (_phoneController.text.isEmpty) {
      _phoneError = 'Por favor, insira seu telefone';
      hasErrors = true;
    }

    if (_passwordController.text.length < 6) {
      _passwordError = 'A senha deve ter pelo menos 6 caracteres';
      hasErrors = true;
    }

    if (_confirmPasswordController.text != _passwordController.text) {
      _confirmPasswordError = 'As senhas não coincidem';
      hasErrors = true;
    }

    setState(() {});
    return !hasErrors;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_validateFields()) return;
    if (!_acceptTerms) return;
    
    debugPrint('Registro: ${_fullNameController.text}, ${_emailController.text}, ${_phoneController.text}, ${_passwordController.text}');
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  'Cadastre-se',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ou faça o',
                      style: TextStyle(fontSize: 26, color: AppColors.primaryText),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => LoginPage())),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _fullNameController, hintText: 'Nome Completo'),
                        const SizedBox(height: 12),
                        CustomTextField(controller: _emailController, hintText: 'Email'),
                        const SizedBox(height: 12),
                        CustomTextField(controller: _phoneController, hintText: 'Telefone'),
                        const SizedBox(height: 12),
                        CustomTextField(controller: _passwordController, hintText: 'Crie uma senha', obscureText: true),
                        const SizedBox(height: 12),
                        CustomTextField(controller: _confirmPasswordController, hintText: 'Confirmar senha', obscureText: true),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: _acceptTerms,
                              onChanged: (value) {
                                setState(() {
                                  _acceptTerms = value!;
                                });
                              },
                              shape: CircleBorder(),
                              activeColor: AppColors.primary,
                            ),
                            Text(
                              'Aceito os termos de uso e diretrizes do app',
                              style: TextStyle(color: AppColors.primaryText),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          text: 'Cadastrar',
                          onPressed: _submit,
                          width: 200,
                          height: 45,
                          fontSize: 22,
                        ),
                        const SizedBox(height: 30),
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
