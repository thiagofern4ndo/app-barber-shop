import 'package:flutter/material.dart';
import 'package:app_barber_shop/screens/pag7.dart'; // Importa o pag7.dart
import 'package:app_barber_shop/widgets/buttons/button_contact.dart'; // Importa o button_contact.dart
import 'package:app_barber_shop/widgets/buttons/button_ServiceOption.dart'; // Importa o button_service_option.dart
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart'; // Importa o button_instagram.dart

class Pag6 extends StatelessWidget {
  const Pag6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServiceSelectionScreen(),
    );
  }
}

class ServiceSelectionScreen extends StatefulWidget {
  @override
  _ServiceSelectionScreenState createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  String? selectedService;
  final Color borderColor =
      const Color(0xFF00FFB4); // Definição da cor desejada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          InstagramIconButton(), // Substitui o ícone da câmera pelo InstagramIconButton
          const SizedBox(width: 20), // Espaçamento
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined, color: borderColor, size: 40),
                  const SizedBox(height: 15),
                  const Text(
                    'Selecione um serviço',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ServiceOptionButton(
                    service: "Corte",
                    selectedService: selectedService,
                    borderColor: borderColor,
                    onTap: () {
                      setState(() {
                        selectedService = "Corte";
                      });
                    },
                  ),
                  ServiceOptionButton(
                    service: "Barba",
                    selectedService: selectedService,
                    borderColor: borderColor,
                    onTap: () {
                      setState(() {
                        selectedService = "Barba";
                      });
                    },
                  ),
                  ServiceOptionButton(
                    service: "Combo",
                    selectedService: selectedService,
                    borderColor: borderColor,
                    onTap: () {
                      setState(() {
                        selectedService = "Combo";
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: selectedService != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Pag7()),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: borderColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                    ),
                    child: const Text('Continuar',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                ContactButton(
                  text: 'Contato',
                  onPressed: () {
                    print('Botão Contato clicado na Página 6');
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Todos os direitos reservados',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
