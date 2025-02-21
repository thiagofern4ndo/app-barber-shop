import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/button_calendar_screen.dart'; // Importa o CalendarButton
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart'; // Importa o ContactButton
import 'package:app_barber_shop/widgets/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:google_fonts/google_fonts.dart'; // Importa o GoogleFonts
import 'package:app_barber_shop/widgets/text/text_direitos.dart';

class Pag7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CalendarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              // Título "Selecione uma Data"
              Padding(
                padding: EdgeInsets.only(top: 100, bottom: 50), // 10 pixels acima e 10 abaixo do título
                child: Text(
                  'Selecione uma Data',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20, // Tamanho do texto
                    fontWeight: FontWeight.bold, // Texto em negrito
                  ),
                ),
              ),
              // Calendário centralizado
              Expanded(
                child: Center(
                  child: CalendarButton(
                    selectedDate: _selectedDate,
                    onDateSelected: _onDateSelected,
                  ),
                ),
              ),
              // Botão "Continuar"
              Padding(
                padding: EdgeInsets.only(bottom: 80, top: 100),
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {
                    // Ação ao pressionar o botão Continuar
                  },
                ),
              ),
              // Texto no rodapé
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    ContactButton(
                      text: 'Contato',
                      onPressed: () {
                        // Ação ao pressionar o botão de contato
                      }, 
                    ),
                    SizedBox(height: 15),
                    TextWidget(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 20,
            child: CustomBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), // Adiciona o CustomBackButton no canto superior direito

          ),
          Positioned(
            top: 10,
            right: 20,
            child: InstagramIconButton(

          
             
            ), // Adiciona o IconButton no canto superior direito

          ),
        ],
      ),
    );
  }
}
