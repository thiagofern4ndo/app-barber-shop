import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_checkbox.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/text/text_direitos.dart';
import 'package:app_barber_shop/screens/select_date.dart'; // 🔄 ALTERAÇÃO AQUI
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicoScreen extends StatefulWidget {
  const ServicoScreen({super.key});

  @override
  _ServicoScreenState createState() => _ServicoScreenState();
}

class _ServicoScreenState extends State<ServicoScreen> {
  final Map<String, bool> _services = {
    'Corte': false,
    'Corte Infantil': false,
    'Barba': false,
    'Sobrancelha': false,
    'Combo': false,
  };

  bool _isAnyServiceSelected() {
    return _services.containsValue(true);
  }

  void _toggleService(String service, bool? isChecked) {
    setState(() {
      _services[service] = isChecked ?? false;
    });
  }

  void _onContinuePressed() {
    if (_isAnyServiceSelected()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalendarSelectionScreen()), // 🔄 ALTERAÇÃO AQUI
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione ao menos um serviço.')),
      );
    }
  }

  Future<void> _launchWhatsApp() async {
    const whatsappUrl = 'https://wa.me/5581999999999';
    final uri = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o WhatsApp.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _buildHeader(),
              const Spacer(),
              _buildTitle(),
              const SizedBox(height: 60),
              _buildServiceList(),
              const Spacer(),
              _buildContinueButton(),
              const Spacer(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(onPressed: () => Navigator.pop(context)),
        InstagramIconButton(),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      'Selecione um ou mais serviços',
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryText,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildServiceList() {
    return Column(
      children: _services.keys.map((service) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: CustomCheckBox(
            text: service,
            isChecked: _services[service]!,
            onChanged: (value) => _toggleService(service, value),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContinueButton() {
    return CustomButton(
      text: 'Continuar',
      height: 45,
      width: 200,
      onPressed: _onContinuePressed,
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        ContactButton(onPressed: _launchWhatsApp),
        const SizedBox(height: 20),
        const TextWidget(),
        const SizedBox(height: 20),
      ],
    );
  }
}
