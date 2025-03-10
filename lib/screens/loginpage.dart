import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart'; 
import 'profissionais.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();  
  String _mode = 'login';

  void _toggleMode(String mode) => setState(() => _mode = mode);

  final emailRegex = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

  void _submit() {
    if (!_formKey.currentState!.saveAndValidate()) return;

    final formData = _formKey.currentState!.value;
    if (_mode == 'login') {
      debugPrint('Login: ${formData['email']}, ${formData['password']}');
    } else if (_mode == 'register') {
      debugPrint('Registro: ${formData['username']}, ${formData['email']}, ${formData['password']}');
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfessionalSelectionScreen()),
    );
    } else {
      debugPrint('Recuperação de senha: ${formData['email']}');
    }
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackButton(onPressed: () => Navigator.maybePop(context)),
          InstagramIconButton(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String name,
    required String hintText,
    bool obscureText = false,
  }) {
    return Column(
      children: [
        CustomTextField(
          controller: TextEditingController(),
          hintText: hintText,
          obscureText: obscureText,
          child: FormBuilderTextField(
            name: name,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: hintText,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$hintText é obrigatório';
              }
              if (name == 'email' && !emailRegex.hasMatch(value)) {
                return 'Email inválido';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_mode == 'register')
          _buildTextField(name: 'username', hintText: 'Nome de Usuário'),
        _buildTextField(name: 'email', hintText: 'Email'),
        if (_mode != 'recover')
          _buildTextField(name: 'password', hintText: 'Senha', obscureText: true),
        CustomButton(
          text: _mode == 'login' ? 'Entrar' : _mode == 'register' ? 'Cadastrar' : 'Recuperar Senha',
          onPressed: _submit,
          width: 180,
          height: 40,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => _toggleMode(_mode == 'login' ? 'register' : 'login'),
          child: Text(
              _mode == 'login' ? 'Criar uma conta' : 'Já tem uma conta? Faça login',
              style: TextStyle(color: AppColors.primaryText)),
        ),
        if (_mode == 'login')
          TextButton(
            onPressed: () => _toggleMode('recover'),
            child: Text('Esqueceu a senha?', style: TextStyle(color: AppColors.primaryText)),
          ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        ContactButton(
          onPressed: () async {
            const whatsappUrl = 'https://wa.me/5581999999999';
            final uri = Uri.parse(whatsappUrl);

            if (await canLaunch(uri.toString())) {
              await launchUrl(uri);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Não foi possível abrir o WhatsApp')),
              );
            }
          },
        ),
        const SizedBox(height: 20),
        TextWidget(),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 70),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FormBuilder(
                    key: _formKey,
                    child: _buildForm(),
                  ),
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }
}
