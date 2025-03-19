import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  @override
  _Appointments createState() => _Appointments();
}

class _Appointments extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 50), // Ajuste o valor conforme necessário
                child: Center(
                  child: Image.asset(
                    'assets/logo.png', // Substitua pelo caminho da sua imagem
                    width: 150,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    'agendamentos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Color(0xFF00FFB4),
                size: 35,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
