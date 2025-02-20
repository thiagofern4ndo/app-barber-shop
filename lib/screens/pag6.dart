import 'package:flutter/material.dart';
import 'package:app_barber_shop/screens/pag7.dart'; // Importa o pag7.dart

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
  final Color borderColor = const Color(0xFF00FFB4); // Definição da cor desejada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined, // Ícone da câmera
              color: borderColor, // Cor do ícone (substitua borderColor pela cor desejada)
              size: 40, // Tamanho do ícone
            ),
            onPressed: () {
              // Ação ao pressionar o botão
            },
          ),
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
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  buildServiceOption("Corte"),
                  buildServiceOption("Barba"),
                  buildServiceOption("Combo"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: selectedService != null ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Pag7()),
                      );
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: borderColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    ),
                    child: const Text('Continuar', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'contato',
                    style: TextStyle(color: borderColor, fontSize: 14, decoration: TextDecoration.underline),
                  ),
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

  Widget buildServiceOption(String service) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedService = service;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2), // Cor aplicada às bordas
          borderRadius: BorderRadius.circular(10),
          color: selectedService == service ? borderColor.withOpacity(0.3) : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              service,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Icon(
              selectedService == service ? Icons.radio_button_checked : Icons.radio_button_off,
              color: borderColor, // Cor aplicada ao ícone
            ),
          ],
        ),
      ),
    );
  }
}