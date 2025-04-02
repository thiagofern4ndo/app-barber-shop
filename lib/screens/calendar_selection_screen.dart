import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:app_barber_shop/components/buttons/custom_button2.dart'; // Importa o CustomButton
import 'package:app_barber_shop/components/buttons/button_instagram.dart';
import 'package:app_barber_shop/components/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:app_barber_shop/components/theme/fonts.dart'; // Importa o AppFonts
import 'package:app_barber_shop/components/text/text_direitos.dart'; // Importa o TextWidget
import 'package:app_barber_shop/components/calendar/calendar_user.dart'; // Importa o CustomCalendar
import 'package:intl/intl.dart'; // Importa o DateFormat
import 'package:intl/date_symbol_data_local.dart'; // Importa o initializeDateFormatting

class CalendarSelectionScreen extends StatefulWidget {
  @override
  _CalendarSelectionScreenState createState() =>
      _CalendarSelectionScreenState();
}

class _CalendarSelectionScreenState extends State<CalendarSelectionScreen> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null).then((_) {
      setState(() {
        // Atualiza o estado após a inicialização da formatação de data
      });
    });
  }

  void _onSelectionChanged(dynamic args) {
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
            child:
                InstagramIconButton(), // Adiciona o IconButton no canto superior direito
          ),
          Column(
            children: [
              // Título "Selecione uma Data"
              Padding(
                padding: EdgeInsets.only(
                    top: 80,
                    bottom: 50), // 10 pixels acima e 10 abaixo do título
                child: Text(
                  'Selecione uma Data',
                  style: AppFonts.main.copyWith(
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
                    width: 300, // Define a largura máxima
                    height: 300, // Define a altura máxima
                    decoration: BoxDecoration(
                      color: Color(0xFF00FFB4), // Define o backgroundColor
                      borderRadius:
                          BorderRadius.circular(20), // Define o borderRadius
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20), // Define o borderRadius
                      child: CustomCalendar(
                        onSelectionChanged: _onSelectionChanged,
                        aoSelecionarDia:
                            (DateTime) {}, // Adiciona o callback aoSelecionarDia
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
                  },
                  isSelected: false, // Adiciona a propriedade isSelected
                ),
              ),
              // Texto no rodapé
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    CustomButton2(
                      text: 'Contato',
                      onPressed: () {
                        // Ação ao pressionar o botão de contato
                      },
                      isSelected: false, // Adiciona a propriedade isSelected
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

class DateRangePickerSelectionChangedArgs {
  dynamic value;
}

class PickerDateRange {
  DateTime startDate;
  DateTime? endDate;

  PickerDateRange(this.startDate, this.endDate);
}
