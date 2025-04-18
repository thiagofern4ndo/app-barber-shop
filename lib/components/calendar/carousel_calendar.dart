import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:http/http.dart' as http;

class CarouselCalendar extends StatefulWidget {
  final int daysToShow;
  final void Function(DateTime)? onDateSelected;

  const CarouselCalendar({
    super.key,
    this.daysToShow = 30,
    this.onDateSelected,
  });

  @override
  State<CarouselCalendar> createState() => _CarouselCalendarState();
}

class _CarouselCalendarState extends State<CarouselCalendar> {
  DateTime? selectedDate;
  late List<DateTime> dates;
  String currentMonth = '';
  List<DateTime> holidays = [];
  bool isLoadingHolidays = true;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    dates = List.generate(
      widget.daysToShow,
      (index) => today.add(Duration(days: index)),
    );
    initializeDateFormatting('pt_BR', null);
    currentMonth = DateFormat.MMMM('pt_BR').format(dates.first);
    fetchHolidays();
  }

  Future<void> fetchHolidays() async {
    final currentYear = DateTime.now().year;
    final url = Uri.parse('https://date.nager.at/api/v2/PublicHolidays/$currentYear/BR');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          holidays = data.map((e) => DateTime.parse(e['date'])).toList();
          isLoadingHolidays = false;
        });
      } else {
        print('Erro ao buscar feriados: ${response.statusCode}');
        setState(() {
          isLoadingHolidays = false;
        });
      }
    } catch (e) {
      print('Erro na requisição de feriados: $e');
      setState(() {
        isLoadingHolidays = false;
      });
    }
  }

  bool _isHoliday(DateTime date) {
    // Verifica se a data é um feriado
    return holidays.any((holiday) {
      return holiday.year == date.year &&
             holiday.month == date.month &&
             holiday.day == date.day;
    });
  }

  bool _isToday(DateTime date) {
    // Verifica se a data é o dia de hoje
    final today = DateTime.now();
    return date.year == today.year &&
           date.month == today.month &&
           date.day == today.day;
  }

  bool _isBlocked(DateTime date) {
    // Verifica se a data é um domingo, feriado ou o dia de hoje
    return date.weekday == DateTime.sunday || _isHoliday(date) || _isToday(date);
  }

  void _onDateTap(DateTime date) {
    final tappedMonth = DateFormat.MMMM('pt_BR').format(date);
    setState(() {
      selectedDate = date;
      if (tappedMonth != currentMonth) {
        currentMonth = tappedMonth;
      }
    });

    widget.onDateSelected?.call(date);
  }

  String _formatWeekday(int weekday) {
    const weekdays = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
    return weekdays[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (isLoadingHolidays) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.01),
          child: Center(
            child: Text(
              toBeginningOfSentenceCase(currentMonth)!,
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSunday = date.weekday == DateTime.sunday;
              final isHoliday = _isHoliday(date);
              final isBlocked = _isBlocked(date);
              final isSelected = selectedDate != null &&
                  DateUtils.isSameDay(selectedDate, date);

              final backgroundColor = isSelected
                  ? AppColors.primary
                  : AppColors.background;

              final borderColor = AppColors.primary;

              final textColor = isBlocked
                  ? AppColors.secondaryText // Para dias bloqueados
                  : isSelected
                      ? AppColors.background
                      : AppColors.primaryText;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: GestureDetector(
                  onTap: isBlocked ? null : () => _onDateTap(date),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _formatWeekday(date.weekday),
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: size.height * 0.005),
                      Container(
                        width: size.width * 0.11,
                        height: size.width * 0.11,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border.all(
                            color: borderColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          DateFormat.d().format(date),
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w800,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
