import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_checkbox.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/screens/select_date.dart';

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
        MaterialPageRoute(
          builder: (context) => const CalendarSelectionScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecione ao menos um serviço.'),
        ),
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
        const SnackBar(
          content: Text('Não foi possível abrir o WhatsApp.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.01),
                    _buildHeader(),
                    SizedBox(height: screenHeight * 0.03),
                    _buildTitle(screenWidth),
                    SizedBox(height: screenHeight * 0.04),
                    _buildServiceList(screenHeight),
                    const Spacer(),
                    _buildContinueButton(screenHeight, screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    _buildFooter(),
                    SizedBox(height: screenHeight * 0.07),
                  ],
                ),
              ),
            ),
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

  Widget _buildTitle(double screenWidth) {
    return Text(
      'Selecione um ou mais serviços',
      style: AppFonts.main.copyWith(
        fontSize: screenWidth * 0.06,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryText,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildServiceList(double screenHeight) {
    return Column(
      children: _services.keys.map((service) {
        return Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.025),
          child: CustomCheckBox(
            text: service,
            isChecked: _services[service]!,
            onChanged: (value) => _toggleService(service, value),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContinueButton(double screenHeight, double screenWidth) {
    return CustomButton(
      text: 'Continuar',
      height: screenHeight * 0.06,
      width: screenWidth * 0.48,
      onPressed: _onContinuePressed,
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        ContactButton(),
      ],
    );
  }
}
