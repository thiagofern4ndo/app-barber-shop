import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/cards/card_reservas.dart'; // Certifique-se de importar o CardReservas
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/theme/fonts.dart'; // Importa o AppFonts

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
                style: AppFonts.main.copyWith(
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
          ProfileIconButton(), // Adiciona o botão de perfil no canto superior direito
        ],
      ),
    );
  }
}