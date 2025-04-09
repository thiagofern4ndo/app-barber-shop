import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_checkbox.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/screens/select_date_time.dart';
import 'package:app_barber_shop/data/services.dart';

class ServicoScreen extends StatefulWidget {
  final List<String>? selectedServices;
  final DateTime? selectedDate;
  final String? selectedHour;
  final String? selectedProfessional;

  const ServicoScreen({
    super.key,
    this.selectedServices,
    this.selectedDate,
    this.selectedHour,
    this.selectedProfessional,
  });

  @override
  State<ServicoScreen> createState() => _ServicoScreenState();
}

class _ServicoScreenState extends State<ServicoScreen> {
  final Map<String, bool> _selected = {};

  @override
  void initState() {
    super.initState();
    for (var service in serviceList) {
      _selected[service.name] = false;
    }
  }

  void _toggleService(String name, bool? value) {
    setState(() {
      _selected[name] = value ?? false;
    });
  }

  bool _isAnyServiceSelected() {
    return _selected.values.contains(true);
  }

  void _onContinuePressed() {
    if (_isAnyServiceSelected()) {
      final selectedServices = _selected.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectHourPage(
            selectedServices: selectedServices,
            selectedDate: widget.selectedDate ?? DateTime.now(),
            selectedHour: widget.selectedHour ?? '',
            selectedProfessional: widget.selectedProfessional ?? '',
          ),
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.01),
                  _buildHeader(),
                  SizedBox(height: size.height * 0.03),
                  _buildTitle(size),
                  SizedBox(height: size.height * 0.04),
                  ...serviceList.map(
                    (service) {
                      final bool isCombo = service.name == 'Combo: Corte e Barba';
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.025),
                        child: CustomCheckBox(
                          service: service,
                          isChecked: _selected[service.name] ?? false,
                          onChanged: (value) => _toggleService(service.name, value),
                          fontSize: isCombo ? size.width * 0.035 : null,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  _buildContinueButton(size),
                  SizedBox(height: size.height * 0.03),
                  _buildFooter(),
                  SizedBox(height: size.height * 0.07),
                ],
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
        const ProfileIconButton(),
      ],
    );
  }

  Widget _buildTitle(Size size) {
    return Text(
      'Selecione um ou mais serviços',
      style: AppFonts.main.copyWith(
        fontSize: size.width * 0.06,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryText,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildContinueButton(Size size) {
    return CustomButton(
      text: 'Continuar',
      height: size.height * 0.06,
      width: size.width * 0.48,
      onPressed: _onContinuePressed,
    );
  }

  Widget _buildFooter() {
    return const ContactButton();
  }
}
