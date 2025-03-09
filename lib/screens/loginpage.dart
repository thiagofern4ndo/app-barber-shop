import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/forms/custom_text_field.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
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
  final TextEditingController _usernameController = TextEditingController();

  String _mode = 'login';
  String? _emailError;
  String? _passwordError;
  String? _usernameError;

  void _toggleMode(String mode) => setState(() => _mode = mode);

  final emailRegex = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

  bool _validateFields() {
    setState(() {
      _emailError = _passwordError = _usernameError = null;

      if (_mode == 'register' && _usernameController.text.isEmpty) {
        _usernameError = 'Por favor, insira um nome de usuário';
      }

      if (_emailController.text.isEmpty || !emailRegex.hasMatch(_emailController.text)) {
        _emailError = 'Por favor, insira um email válido';
      }

      if (_mode != 'recover' && _passwordController.text.length < 6) {
        _passwordError = 'A senha deve ter pelo menos 6 caracteres';
      }
    });

    return _emailError == null && _passwordError == null && _usernameError == null;
  }

  void _submit() {
    if (!_validateFields()) return;

    if (_mode == 'login') {
      debugPrint('Login: ${_emailController.text}, ${_passwordController.text}');
    } else if (_mode == 'register') {
      debugPrint('Registro: ${_usernameController.text}, ${_emailController.text}, ${_passwordController.text}');
    } else {
      debugPrint('Recuperação de senha: ${_emailController.text}');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
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
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    String? errorText,
  }) {
    return Column(
      children: [
        CustomTextField(
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(errorText, style: const TextStyle(color: Colors.red)),
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
          _buildTextField(
              controller: _usernameController,
              hintText: 'Nome de Usuário',
              errorText: _usernameError),
        _buildTextField(
            controller: _emailController, hintText: 'Email', errorText: _emailError),
        if (_mode != 'recover')
          _buildTextField(
              controller: _passwordController,
              hintText: 'Senha',
              obscureText: true,
              errorText: _passwordError),
        CustomButton(
          text: _mode == 'login' ? 'Login' : _mode == 'register' ? 'Cadastrar' : 'Recuperar Senha',
          onPressed: _submit,
          width: 200,
          height: 35,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => _toggleMode(_mode == 'login' ? 'register' : 'login'),
          child: Text(
              _mode == 'login' ? 'Criar uma conta' : 'Já tem uma conta? Faça login',
              style: const TextStyle(color: Colors.white)),
        ),
        if (_mode == 'login')
          TextButton(
            onPressed: () => _toggleMode('recover'),
            child: const Text('Esqueceu a senha?', style: TextStyle(color: Colors.white)),
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
            if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
              await launchUrl(Uri.parse(whatsappUrl));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Não foi possível abrir o WhatsApp')),
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
                  child: Form(key: _formKey, child: _buildForm()),
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
