import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart';
import 'package:app_barber_shop/components/buttons/button_contact.dart';
import 'package:app_barber_shop/components/buttons/profile_button.dart';
import 'package:app_barber_shop/components/buttons/custom_button.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:intl/intl.dart';

class AgendamentoInfoPage extends StatelessWidget {
  final String selectedProfessional;
  final List<String> selectedServices;
  final DateTime selectedDate;
  final String selectedHour;

  const AgendamentoInfoPage({
    super.key,
    required this.selectedProfessional,
    required this.selectedServices,
    required this.selectedDate,
    required this.selectedHour,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final verticalSpacing = size.height * 0.03;
    final formattedDate = DateFormat('dd/MM').format(selectedDate);

    final double boxWidth = size.width * 0.75;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(onPressed: () => Navigator.pop(context)),
                      const ProfileIconButton(),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  Center(
                    child: Text(
                      'Informações de Agendamento',
                      style: AppFonts.main.copyWith(
                        fontSize: size.width * 0.065,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),

                  Center(
                    child: Column(
                      children: [
                        buildInfoBox(
                          label: 'Profissional:',
                          value: selectedProfessional,
                          width: boxWidth,
                          size: size,
                        ),
                        SizedBox(height: verticalSpacing),
                        buildInfoBox(
                          label: 'Serviço:',
                          value: selectedServices.join(', '),
                          width: boxWidth,
                          size: size,
                        ),
                        SizedBox(height: verticalSpacing),
                        buildInfoBox(
                          label: 'Data:',
                          value: formattedDate,
                          width: boxWidth,
                          size: size,
                        ),
                        SizedBox(height: verticalSpacing),
                        buildInfoBox(
                          label: 'Hora:',
                          value: selectedHour,
                          width: boxWidth,
                          size: size,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),

                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: 'Confirmar Agendamento',
                      onPressed: () {
                        // lógica de confirmação
                      },
                      height: size.height * 0.06,
                      width: size.width * 0.75,
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    height: size.height * 0.18,
                    child: const ContactButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoBox({
    required String label,
    required String value,
    required double width,
    required Size size,
  }) {
    return SizedBox(
      width: width,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.017,
          horizontal: size.width * 0.04,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary, width: 3.5),
        ),
        child: RichText(
          text: TextSpan(
            style: AppFonts.main.copyWith(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: '$label ',
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
