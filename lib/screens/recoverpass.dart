import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:url_launcher/url_launcher.dart'; 

class RecoverPassPage extends StatefulWidget {
  const RecoverPassPage({super.key});

  @override
  _RecoverPassPageState createState() => _RecoverPassPageState();
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
    }

    else if (_emailController.text.length < 10) {
      _emailError = 'Por favor, insira um telefone válido';
      hasErrors = true;
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
            const SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryText, 
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Digite Email ou Telefone cadastrados!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary, 
                ),
              ),
            ),
            const SizedBox(height: 80),

            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _emailController, hintText: 'Email ou Telefone'),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: 'Recuperar Senha',
                          onPressed: _submit,
                          width: 250,
                          height: 45,
                          fontSize: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ContactButton(
              onPressed: () async {
                const whatsappUrl = 'https://wa.me/5581999999999';
                if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                  await launchUrl(Uri.parse(whatsappUrl));
                } else {
                  throw 'Não foi possível abrir o WhatsApp';
                }
              },
            ),
            const SizedBox(height: 20),
            const TextWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
