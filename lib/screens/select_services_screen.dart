import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/button_checkbox.dart';
import 'package:app_barber_shop/components/buttons/button_main.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/screens/select_date_hour_screen.dart';
import 'package:app_barber_shop/data/services.dart';
import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:app_barber_shop/models/booking_provider.dart';

class ServicoScreen extends StatelessWidget {
  const ServicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookingProvider = Provider.of<BookingProvider>(context);

    return CustomScaffold(
      showBackButton: true,
      showProfileRight: true,
      showContactButton: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                _buildTitle(size),
                SizedBox(height: size.height * 0.04),
                ...serviceList.map(
                  (service) => Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.025),
                    child: CustomCheckBox(
                      service: service,
                      // Verifica se o serviço está na lista de selecionados
                      isChecked: bookingProvider.currentBooking.selectedServices
                          .any((s) => s.name == service.name),
                      onChanged: (value) {
                        if (value ?? false) {
                          // Adiciona o serviço à reserva via Provider
                          bookingProvider.addServiceToBooking(service);
                        } else {
                          // Remove o serviço da reserva via Provider
                          bookingProvider.removeServiceFromBooking(service.name);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                _buildContinueButton(size, bookingProvider, context),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildContinueButton(Size size, BookingProvider bookingProvider, BuildContext context) {
    return CustomButton(
      text: 'Continuar',
      height: size.height * 0.06,
      width: size.width * 0.48,
      onPressed: () {
        if (bookingProvider.currentBooking.selectedServices.isNotEmpty) { 
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SelectHourPage(), 
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Por favor, selecione ao menos um serviço.'),
            ),
          );
        }
      },
    );
  }
}
