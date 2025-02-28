import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart';
import 'package:app_barber_shop/widgets/text/text_direitos.dart';
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_back.dart';
import 'package:app_barber_shop/widgets/forms/custom_text_field.dart';
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importando o botão personalizado
import 'package:url_launcher/url_launcher.dart';
import 'profissionais.dart'; // importando tela de profissionais

// Página de Login, Cadastro e Recuperação de Senha
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Chave para o formulário
  String _email = ''; // Variável para armazenar o email
  String _password = ''; // Variável para armazenar a senha
  String _username = ''; // Variável para armazenar o nome de usuário
  String _mode = 'login'; // Modo inicial da tela: 'login'

  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  // Erros dos campos de formulário
  String? _emailError;
  String? _passwordError;
  String? _usernameError;

  // Função para alternar entre os modos (login, cadastro, recuperação)
  void _toggleMode(String mode) {
    setState(() {
      _mode = mode;
    });
  }

  // Função para validar os campos antes de submeter o formulário
  bool _validateFields() {
    bool isValid = true;
    
    // Limpar erros anteriores
    setState(() {
      _emailError = null;
      _passwordError = null;
      _usernameError = null;
    });

    // Validação para 'register' (Cadastro)
    if (_mode == 'register' && _usernameController.text.isEmpty) {
      _usernameError = 'Por favor, insira um nome de usuário';
      isValid = false;
    }

    // Validação para email
    if (_emailController.text.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text)) {
      _emailError = 'Por favor, insira um email válido';
      isValid = false;
    }

    // Validação para senha
    if (_mode != 'recover' && (_passwordController.text.isEmpty || _passwordController.text.length < 6)) {
      _passwordError = 'A senha deve ter pelo menos 6 caracteres';
      isValid = false;
    }

    return isValid;
  }

  // Função para submeter o formulário
  void _submit() {
    if (_validateFields()) {
      // Armazenando os valores
      _email = _emailController.text;
      _password = _passwordController.text;
      if (_mode == 'register') {
        _username = _usernameController.text;
      }

      // Lógica para o login, cadastro e recuperação de senha
      if (_mode == 'login') {
        print('Login com: $_email, $_password');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfessionalSelectionScreen()), // Navega para a tela de seleção de profissionais
        );
      } else if (_mode == 'register') {
        print('Registro com: $_username, $_email, $_password');
      } else if (_mode == 'recover') {
        print('Recuperação de senha para: $_email');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Barra superior com botões de navegação e Instagram
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Disposição dos botões
                children: [
                  CustomBackButton(
                    onPressed: () => Navigator.pop(context), // Botão para voltar
                  ),
                  InstagramIconButton(), // Ícone do Instagram
                ],
              ),
            ),
            const SizedBox(height: 70), // Espaçamento após a barra superior
            // Título da página, baseado no modo atual
            Text(
              _mode == 'login' ? 'Login' : _mode == 'register' ? 'Cadastro' : 'Recuperação de Senha',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey, // Chave do formulário
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Campo de nome de usuário (apenas no modo 'register')
                        if (_mode == 'register') ...[
                          CustomTextField(
                            controller: _usernameController,
                            hintText: 'Nome de Usuário', // Texto de sugestão no campo
                            width: 300, // Largura fixa
                            height: 60, // Altura fixa
                          ),
                          if (_usernameError != null)
                            Text(_usernameError!, style: TextStyle(color: Colors.red)), // Exibe erro de validação
                          const SizedBox(height: 16),
                        ],
                        // Campo de email
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email', // Texto de sugestão no campo
                          width: 300, // Largura fixa
                          height: 60, // Altura fixa
                        ),
                        if (_emailError != null)
                          Text(_emailError!, style: TextStyle(color: Colors.red)), // Exibe erro de validação
                        const SizedBox(height: 16),
                        // Campo de senha (apenas no modo 'login' e 'register')
                        if (_mode != 'recover') ...[ 
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Senha', // Texto de sugestão no campo
                            obscureText: true, // Torna o campo de senha invisível
                            width: 300, // Largura fixa
                            height: 60, // Altura fixa
                          ),
                          if (_passwordError != null)
                            Text(_passwordError!, style: TextStyle(color: Colors.red)), // Exibe erro de validação
                          const SizedBox(height: 16),
                        ],
                        // Botão para submeter o formulário (Login, Cadastro ou Recuperação de Senha)
                        CustomButton(
                          text: _mode == 'login' ? 'Login' : _mode == 'register' ? 'Cadastrar' : 'Recuperar Senha',
                          onPressed: _submit,
                          width: 200, 
                          height: 35, 
                        ),
                        const SizedBox(height: 20),
                        // Botão para alternar entre os modos (Login, Cadastro, Recuperação)
                        TextButton(
                          onPressed: () {
                            if (_mode == 'login') {
                              _toggleMode('register'); // Alterna para o modo 'register'
                            } else if (_mode == 'register') {
                              _toggleMode('login'); // Alterna para o modo 'login'
                            } else {
                              _toggleMode('login'); // Alterna para o modo 'login' ao recuperar senha
                            }
                          },
                          child: Text(
                            _mode == 'login' ? 'Criar uma conta' : 'Já tem uma conta? Faça login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        // Botão de recuperação de senha (apenas no modo 'login')
                        if (_mode == 'login') ...[ 
                          TextButton(
                            onPressed: () {
                              _toggleMode('recover'); // Alterna para o modo 'recover'
                            },
                            child: Text('Esqueceu a senha?', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80), // Espaçamento após os campos de formulário
            // Botão de contato
            ContactButton(
              text: 'Contato', // Texto exibido no botão
              onPressed: () async {
                const whatsappUrl = 'https://wa.me/5581999999999'; // URL para abrir o WhatsApp com um número específico
                if (await canLaunch(whatsappUrl)) {
                  await launch(whatsappUrl); // Tenta abrir o WhatsApp
                } else {
                  throw 'Não foi possível abrir o WhatsApp'; // Erro caso não consiga abrir
                }
              },
            ),
            const SizedBox(height: 20), // Espaçamento inferior entre os botões

            // Texto de rodapé exibindo direitos autorais
            TextWidget(), // Exibe o texto "Todos os direitos reservados"
            const SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }
}
