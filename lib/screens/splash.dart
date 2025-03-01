import 'package:flutter/material.dart';
import 'mainscreen.dart';  //importando a mainscreen, tela depois da splash

// Tela de Splash que exibe o logo por alguns segundos antes de navegar para a tela principal
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Construtor da SplashScreen, que passa a chave para o widget pai

  @override
  _SplashScreenState createState() => _SplashScreenState(); // Criação do estado da tela de splash
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); // Chama o método initState da classe pai para inicializar o estado
    
    // Atraso de 3 segundos antes de navegar para a próxima tela (MainScreen)
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()), // Navega para a MainScreen após o atraso
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',  // Caminho da imagem do logo a ser exibida
          width: 200,  // Largura da imagem
          height: 200, // Altura da imagem
        ),
      ),
    );
  }
}