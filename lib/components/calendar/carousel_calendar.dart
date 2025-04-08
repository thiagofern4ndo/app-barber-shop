import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class CarouselCalendar extends StatefulWidget {
  final Function(DateTime) aoSelecionarDia;

  const CarouselCalendar({
    super.key,
    required this.aoSelecionarDia, required Null Function(dynamic day) onDaySelected,
  });

  @override
  _CarouselCalendarState createState() => _CarouselCalendarState();
}

class _CarouselCalendarState extends State<CarouselCalendar> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  // Gera os próximos 7 dias
  List<DateTime> _generateNextDays() {
    final List<DateTime> days = [];
    DateTime day = _focusedDay;
    for (int i = 0; i < 7; i++) {
      days.add(day);
      day = day.add(const Duration(days: 1));
    }
    return days;
  }

  // Verifica se o dia é válido (não é domingo)
  bool _isValidDay(DateTime day) {
    return day.weekday != DateTime.sunday;
  }

  // Verifica se o dia é hoje
  bool _isToday(DateTime day) {
    final now = DateTime.now();
    return day.day == now.day &&
        day.month == now.month &&
        day.year == now.year;
  }

  // Seleciona o dia e chama o callback
  void _selectDay(DateTime day) {
    if (_isValidDay(day)) {
      setState(() {
        _selectedDay = day;
      });
      widget.aoSelecionarDia(day);
    }
  }

  // Compara dois DateTime para ver se são o mesmo dia
  bool _isSameDay(DateTime day1, DateTime day2) {
    return day1.year == day2.year &&
        day1.month == day2.month &&
        day1.day == day2.day;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double daySize = size.width * 0.12;
    final double fontSize = size.width * 0.03;

    final List<DateTime> days = _generateNextDays();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(days.length, (index) {
          final day = days[index];
          final bool isSelected = _isSameDay(_selectedDay, day);
          final bool isToday = _isToday(day);
          final bool isSunday = day.weekday == DateTime.sunday;

          return GestureDetector(
            onTap: () => _selectDay(day),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : AppColors.primary,
                borderRadius: BorderRadius.circular(daySize * 0.2),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: isSelected ? 2 : 0,
                ),
              ),
              width: daySize,
              height: daySize,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Exibe o nome do dia
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: Text(
                      _getDayOfWeek(day),
                      style: AppFonts.main.copyWith(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                        color: isSunday
                            ? Colors.grey
                            : isToday
                                ? AppColors.primary
                                : AppColors.primaryText,
                      ),
                    ),
                  ),
                  // Exibe o número do dia
                  Text(
                    '${day.day}',
                    style: AppFonts.main.copyWith(
                      fontSize: fontSize * 1.5,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? AppColors.primary
                          : isSunday
                              ? Colors.grey
                              : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  // Retorna o nome do dia da semana
  String _getDayOfWeek(DateTime day) {
    switch (day.weekday) {
      case 1: return 'Seg';
      case 2: return 'Ter';
      case 3: return 'Qua';
      case 4: return 'Qui';
      case 5: return 'Sex';
      case 6: return 'Sáb';
      case 7: return 'Dom';
      default: return '';
    }
  }
}
