import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/text/text_direitos.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_back.dart';
import 'package:app_barber_shop/widgets/forms/custom_text_field.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profissionais.dart'; //importando a tela de profissionais

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

  final emailRegex =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

  bool _validateFields() {
    bool isValid = true;

    setState(() {
      _emailError = _passwordError = _usernameError = null;
    });

    if (_mode == 'register' && _usernameController.text.isEmpty) {
      setState(() => _usernameError = 'Por favor, insira um nome de usuário');
      isValid = false;
    }

    if (_emailController.text.isEmpty ||
        !emailRegex.hasMatch(_emailController.text)) {
      setState(() => _emailError = 'Por favor, insira um email válido');
      isValid = false;
    }

    if (_mode != 'recover' && _passwordController.text.length < 6) {
      setState(
          () => _passwordError = 'A senha deve ter pelo menos 6 caracteres');
      isValid = false;
    }

    return isValid;
  }

  void _submit() {
    if (!_validateFields()) return;

    if (_mode == 'login') {
      debugPrint(
          'Login: ${_emailController.text}, ${_passwordController.text}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProfessionalSelectionScreen()), //adicionei a rota para tela de profissionais ao logar
      );
    } else if (_mode == 'register') {
      debugPrint(
          'Registro: ${_usernameController.text}, ${_emailController.text}, ${_passwordController.text}');
    } else {
      debugPrint('Recuperação de senha: ${_emailController.text}');
    }
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
            controller: _emailController,
            hintText: 'Email',
            errorText: _emailError),
        if (_mode != 'recover')
          _buildTextField(
              controller: _passwordController,
              hintText: 'Senha',
              obscureText: true,
              errorText: _passwordError),
        CustomButton(
          text: _mode == 'login'
              ? 'Login'
              : _mode == 'register'
                  ? 'Cadastrar'
                  : 'Recuperar Senha',
          onPressed: _submit,
          width: 200,
          height: 35,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => _toggleMode(_mode == 'login' ? 'register' : 'login'),
          child: Text(
              _mode == 'login'
                  ? 'Criar uma conta'
                  : 'Já tem uma conta? Faça login',
              style: const TextStyle(color: Colors.white)),
        ),
        if (_mode == 'login')
          TextButton(
            onPressed: () => _toggleMode('recover'),
            child: const Text('Esqueceu a senha?',
                style: TextStyle(color: Colors.white)),
          ),
      ],
    );
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
                  CustomBackButton(
                      onPressed: () => Navigator.maybePop(context)),
                  InstagramIconButton(),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Text(
              _mode == 'login'
                  ? 'Login'
                  : _mode == 'register'
                      ? 'Cadastro'
                      : 'Recuperação de Senha',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(key: _formKey, child: _buildForm()),
                ),
              ),
            ),
            const SizedBox(height: 80),
            ContactButton(
              onPressed: () async {
                const whatsappUrl =
                    'https://wa.me/5581999999999'; // URL para abrir o WhatsApp com um número específico
                if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                  await launchUrl(
                      Uri.parse(whatsappUrl)); // Tenta abrir o WhatsApp
                } else {
                  throw 'Não foi possível abrir o WhatsApp'; // Erro caso não consiga abrir
                }
              },
            ),
            const SizedBox(height: 20),
            TextWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
