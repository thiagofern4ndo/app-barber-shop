import 'package:flutter/material.dart';

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

  void _onDaySelected(int day) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 20, // Tamanho do texto
                fontWeight: FontWeight.bold, // Texto em negrito
              ),
            ),
          ),
          // Calendário centralizado
          Expanded(
            child: Center(
              child: Container(
                width: 250, // Largura fixa para o calendário
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF00FFB4), // Cor de fundo #00ffb4
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _buildCalendar(),
              ),
            ),
          ),
          // Botão "Continuar"
          Padding(
            padding: EdgeInsets.only(bottom: 100, top:0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00FFB4), // Cor do botão #00ffb4
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                // Ação ao pressionar o botão Continuar
              },
              child: const Text('Continuar', style: TextStyle(color: Colors.black, fontSize: 16)),
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
                    style: TextStyle(
                      color: Color(0xFF00FFB4), // Cor #00ffb4
                      fontSize: 14,
                      // Sublinhado
                    ),
                  ),
                ),
                Text('Todos os direitos reservados',
                     style: TextStyle(color: Colors.white54, fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildWeekDaysRow(),
        SizedBox(height: 10),
        _buildDaysGrid(),
      ],
    );
  }

  Widget _buildWeekDaysRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb']
          .map((day) => Text(day,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))
          .toList(),
    );
  }

  Widget _buildDaysGrid() {
    DateTime firstDayOfMonth =
        DateTime(_selectedDate.year, _selectedDate.month, 1);
    int daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    int startingWeekday = firstDayOfMonth.weekday;

    List<Widget> dayWidgets = [];

    // Preenche os dias vazios no início do mês
    for (int i = 1; i < startingWeekday; i++) {
      dayWidgets.add(Container());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(
        GestureDetector(
          onTap: () => _onDaySelected(day),
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color:
                  _selectedDate.day == day ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: _selectedDate.day == day ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Impede a rolagem do GridView
      crossAxisCount: 7,
      childAspectRatio: 1.2, // Ajusta a proporção dos itens
      children: dayWidgets,
    );
  }
}
