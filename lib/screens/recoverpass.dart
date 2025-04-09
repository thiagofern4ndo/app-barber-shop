import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class RecoverPassPage extends StatefulWidget {
  const RecoverPassPage({super.key});

  @override
  State<RecoverPassPage> createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  bool _validateFields() {
    bool hasErrors = false;

    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      _emailError = 'Por favor, insira um email válido';
      hasErrors = true;
    } else if (_emailController.text.length < 10) {
      _emailError = 'Por favor, insira um telefone válido';
      hasErrors = true;
    } else {
      _emailError = null;
    }

    setState(() {});
    return !hasErrors;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_validateFields()) return;

    debugPrint('Recuperação de senha: ${_emailController.text}');
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBackButton(onPressed: () => Navigator.maybePop(context)),
                        InstagramIconButton(),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Text(
                      'Esqueceu a senha?',
                      style: AppFonts.main.copyWith(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Digite Email ou Telefone cadastrados!',
                      style: AppFonts.main.copyWith(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email ou Telefone',
                            errorText: _emailError,
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          CustomButton(
                            text: 'Recuperar Senha',
                            onPressed: _submit,
                            width: screenWidth * 0.65,
                            height: screenHeight * 0.06,
                            fontSize: screenWidth * 0.045,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ContactButton(),
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
