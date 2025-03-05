import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/custom_button2.dart'; // Importa o CustomButton2

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

    return CustomButton2(
      text: text,
      isSelected: isSelected,
      onPressed: () {
        setState(() {
          horarioSelecionado = text;
        });
      },
    );
  }
}