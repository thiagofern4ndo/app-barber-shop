import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart'; // Importa o ContactButton
import 'package:app_barber_shop/widgets/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:google_fonts/google_fonts.dart'; // Importa o GoogleFonts
import 'package:app_barber_shop/widgets/text/text_direitos.dart'; // Importa o TextWidget

class Pag7 extends StatefulWidget {
  @override
  _Pag7State createState() => _Pag7State();
}

class _Pag7State extends State<Pag7> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = DateFormat('dd/MM/yyyy').format(args.value);
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 20,
            child: CustomBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), // Adiciona o CustomBackButton no canto superior esquerdo
          ),
          Positioned(
            top: 10,
            right: 20,
            child: InstagramIconButton(), // Adiciona o IconButton no canto superior direito
          ),
          Column(
            children: [
              // Título "Selecione uma Data"
              Padding(
                padding: EdgeInsets.only(top: 100, bottom: 50), // 10 pixels acima e 10 abaixo do título
                child: Text(
                  'Selecione uma Data',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20, // Tamanho do texto
                    fontWeight: FontWeight.bold, // Texto em negrito
                  ),
                ),
              ),
              // Calendário centralizado
              Expanded(
                child: Center(
                  child: Container(
                    width: 350, // Define a largura máxima
                    height: 350, // Define a altura máxima
                    decoration: BoxDecoration(
                      color: Color(0xFF00FFB4), // Define o backgroundColor
                      borderRadius: BorderRadius.circular(20), // Define o borderRadius
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Define o borderRadius
                      child: SfDateRangePicker(
                        headerStyle: DateRangePickerHeaderStyle(
                          backgroundColor: Color(0xFF00FFB4), // Define o backgroundColor do cabeçalho
                        ),
                        headerHeight: 50, // Define a altura do cabeçalho
                        showNavigationArrow: false,
                       // locale: const Locale('pt', 'BR'), // Define o locale para Português do Brasil
                        backgroundColor: Colors.transparent, // Define o backgroundColor como transparente
                        onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.single, // Permite selecionar uma única data
                        initialSelectedDate: DateTime.now(),
                      ),
                    ),
                  ),
                ),
              ),
              // Botão "Continuar"
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {
                    // Ação ao pressionar o botão Continuar
                  }, isSelected: false,
                ),
              ),
              // Texto no rodapé
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Contato',
                      onPressed: () {
                        // Ação ao pressionar o botão de contato
                      },
                    ),
                    SizedBox(height: 15),
                    TextWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}