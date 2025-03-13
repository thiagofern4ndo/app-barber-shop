import 'package:flutter/material.dart';

class ConfirmationSuccessScreen extends StatelessWidget {
  const ConfirmationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(height: 25),
           
              Padding(
                padding: const EdgeInsets.only(top: 50), // Ajuste o valor conforme necessário
                child: Center(
                  child: Image.asset(
                    'assets/logo.png', // Substitua pelo caminho da sua imagem
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Confirmação bem-sucedida!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
            ],
          ),
          
           const SizedBox(height: 25),
          Center(
            child: const Icon(
              Icons.check_circle,
              color:  Color(0xFF00FFB4),
              size: 200,
            ),
          ),
          
        ],
      ),
      
      
    );
    
  }
}