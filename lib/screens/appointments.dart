import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/cards/card_reservas.dart'; // Certifique-se de importar o CardReservas

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
                    'assets/logo.png',
                    width: 150,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
          Center(
            child: CardReservas(), // Centraliza o CardReservas no centro da tela
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