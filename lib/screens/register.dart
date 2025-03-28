// register.dart
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/theme/colors.dart';

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
            const SizedBox(height: 50),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _fullNameController, hintText: 'Nome Completo'),
                        CustomTextField(controller: _emailController, hintText: 'Email'),
                        CustomTextField(controller: _phoneController, hintText: 'Telefone'),
                        CustomTextField(controller: _passwordController, hintText: 'Crie uma senha', obscureText: true),
                        CustomTextField(controller: _confirmPasswordController, hintText: 'Confirmar senha', obscureText: true),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: 'Cadastrar',
                          onPressed: _submit,
                          width: 200,
                          height: 35,
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
