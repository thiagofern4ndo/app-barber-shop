import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/button_calendar_screen.dart'; // Importa o CalendarButton
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:google_fonts/google_fonts.dart'; // Importa o GoogleFonts

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0, // Remove a sombra do AppBar
      ),
      body: Column(
        children: [
          // Título "Selecione uma Data"
          Padding(
            padding: EdgeInsets.only(top: 100, bottom: 0), // 10 pixels acima e 10 abaixo do título
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
            padding: EdgeInsets.only(bottom: 100, top: 0),
            child: CustomButton(
              text: 'Continuar',
              onPressed: () {
                // Ação ao pressionar o botão Continuar
              },
            ),
          ),
          // Texto no rodapé
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'contato',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF00FFB4), // Cor #00ffb4
                      fontSize: 14,
                      decoration: TextDecoration.underline, // Sublinhado
                    ),
                  ),
                ),
                Text(
                  'Todos os direitos reservados',
                  style: GoogleFonts.poppins(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
