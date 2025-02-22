import 'package:flutter/material.dart';

class ButtonHorario extends StatefulWidget {
  const ButtonHorario({super.key});

  @override
  State<ButtonHorario> createState() => _ButtonHorarioState();
}

class _ButtonHorarioState extends State<ButtonHorario> {
  final List<String> horarios = [
    for (int i = 8; i <= 19; i++) '${i.toString().padLeft(2, '0')}:00'
  ];

  String? horarioSelecionado;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: horarios.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        itemBuilder: (context, index) {
          return _buildHorarioButton(horarios[index]);
        },
      ),
    );
  }

  Widget _buildHorarioButton(String text) {
    bool isSelected = horarioSelecionado == text;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side:
            BorderSide(color: isSelected ? Colors.greenAccent : Colors.white54),
        backgroundColor: isSelected ? Colors.greenAccent : Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(100, 50),
      ),
      onPressed: () {
        setState(() {
          horarioSelecionado = text;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.greenAccent,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
