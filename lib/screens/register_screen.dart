import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/screens/login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
    } else {
      _fullNameError = null;
    }

    if (_emailController.text.isEmpty) {
      _emailError = 'Por favor, insira um email válido';
      hasErrors = true;
    } else {
      _emailError = null;
    }

    if (_phoneController.text.isEmpty) {
      _phoneError = 'Por favor, insira seu telefone';
      hasErrors = true;
    } else {
      _phoneError = null;
    }

    if (_passwordController.text.length < 6) {
      _passwordError = 'A senha deve ter pelo menos 6 caracteres';
      hasErrors = true;
    } else {
      _passwordError = null;
    }

    if (_confirmPasswordController.text != _passwordController.text) {
      _confirmPasswordError = 'As senhas não coincidem';
      hasErrors = true;
    } else {
      _confirmPasswordError = null;
    }

    setState(() {});
    return !hasErrors;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_validateFields()) return;
    if (!_acceptTerms) return;

    debugPrint(
        'Registro: ${_fullNameController.text}, ${_emailController.text}, ${_phoneController.text}, ${_passwordController.text}');
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
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBackButton(
                            onPressed: () => Navigator.maybePop(context)),
                        InstagramIconButton(),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Cadastre-se',
                      style: AppFonts.main.copyWith(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ou faça o',
                          style: AppFonts.main.copyWith(
                            fontSize: screenWidth * 0.055,
                            color: AppColors.primaryText,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage())),
                          child: Text(
                            'Login',
                            style: AppFonts.main.copyWith(
                              fontSize: screenWidth * 0.065,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _fullNameController,
                            hintText: 'Nome Completo',
                            errorText: _fullNameError,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                            errorText: _emailError,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          CustomTextField(
                            controller: _phoneController,
                            hintText: 'Telefone',
                            errorText: _phoneError,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Crie uma senha',
                            obscureText: true,
                            errorText: _passwordError,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          CustomTextField(
                            controller: _confirmPasswordController,
                            hintText: 'Confirmar senha',
                            obscureText: true,
                            errorText: _confirmPasswordError,
                          ),
                          SizedBox(height: screenHeight * 0.01),
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
                                shape: const CircleBorder(),
                                activeColor: AppColors.primary,
                              ),
                              Expanded(
                                child: Text(
                                  'Aceito os termos de uso e diretrizes do app',
                                  style: AppFonts.main.copyWith(
                                    fontSize: screenWidth * 0.032,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          CustomButton(
                            text: 'Cadastrar',
                            onPressed: _submit,
                            width: screenWidth * 0.58,
                            height: screenHeight * 0.058,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          ContactButton(),
                        ],
                      ),
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
