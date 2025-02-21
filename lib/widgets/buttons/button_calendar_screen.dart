// botão calendário com a data selecionada 

import 'package:flutter/material.dart';

class CalendarButton extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarButton({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _CalendarButtonState createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  void _onDaySelected(int day) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
      widget.onDateSelected(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340, // Altura fixa para o calendário
      width: 340, // Largura fixa para o calendário
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF00FFB4), // Cor de fundo #00ffb4
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildWeekDaysRow(),
          SizedBox(height: 10),
          _buildDaysGrid(),
        ],
      ),
    );
  }

  Widget _buildWeekDaysRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb']
          .map((day) => Text(day,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))
          .toList(),
    );
  }

  Widget _buildDaysGrid() {
    DateTime firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    int daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
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
              color: _selectedDate.day == day ? Colors.blue : Colors.transparent,
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