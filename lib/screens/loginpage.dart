import 'package:app_barber_shop/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'profissionais.dart';
import 'recoverpass.dart';

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
  
  final emailRegex = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

  bool _validateFields() {
    bool hasErrors = false;

    if (_emailController.text.isEmpty || !emailRegex.hasMatch(_emailController.text)) {
      _emailError = 'Por favor, insira um email válido';
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
    if (!_formKey.currentState!.validate()) return;
    if (!_validateFields()) return;
    
    // Simulando login
    debugPrint('Login: ${_emailController.text}, ${_passwordController.text}');
    
    if (_emailController.text.isNotEmpty && _passwordController.text.length >= 6) {
      // Navega para a tela de profissionais
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfessionalSelectionScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('Email ou senha inválidos.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
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
            const SizedBox(height: 150),
            Column(
              children: [
                Text(
                  'Entre',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ou ',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => RegisterPage())),
                      child: Text(
                        'cadastre-se',
                        style: TextStyle(fontSize: 24, color: AppColors.primary),
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
                          Text(_emailError!, style: TextStyle(color: AppColors.thirdTextColor)),
                        const SizedBox(height: 32),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Senha',
                          obscureText: true,
                        ),
                        if (_passwordError != null)
                          Text(_passwordError!, style: TextStyle(color: AppColors.thirdTextColor)),
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
                          child: Text('Esqueceu a senha?', style: TextStyle(color: AppColors.primaryText)),
                        ),
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