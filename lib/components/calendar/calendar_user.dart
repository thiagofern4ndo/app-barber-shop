import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime) aoSelecionarDia;

  const CustomCalendar({super.key, required this.aoSelecionarDia});

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime? _selectedDay;
  DateTime _currentMonth = DateTime.now();

  bool _isValidDay(DateTime day) {
    return day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.month == _currentMonth.month &&
        day.year == _currentMonth.year;
  }

  bool _isToday(DateTime day) {
    final now = DateTime.now();
    return day.day == now.day &&
        day.month == now.month &&
        day.year == now.year;
  }

  void _selectDay(DateTime day) {
    if (_isValidDay(day)) {
      setState(() {
        _selectedDay = day;
      });
      widget.aoSelecionarDia(day);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double calendarHeight = size.height * 0.375;
    final double calendarWidth = size.width * 0.7;
    final double padding = size.width * 0.03;
    final double daySize = size.width * 0.08;
    final double fontSize = size.width * 0.035;

    final String nomeMes =
        DateFormat.MMMM('pt_BR').format(_currentMonth).capitalize();

    return Container(
      height: calendarHeight,
      width: calendarWidth,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.chevron_left,
                  color: AppColors.primary, size: fontSize * 2),
              Text(
                nomeMes,
                style: AppFonts.main.copyWith(
                  fontSize: size.width * 0.055,
                  fontWeight: FontWeight.w900,
                  color: AppColors.background,
                ),
              ),
              Icon(Icons.chevron_right,
                  color: AppColors.primary, size: fontSize * 2),
            ],
          ),
          Expanded(
            child: CalendarCarousel(
              onDayPressed: (DateTime date, List events) {
                _selectDay(date);
              },
              onCalendarChanged: (DateTime date) {
                setState(() {
                  _currentMonth = DateTime(date.year, date.month);
                });
              },
              weekendTextStyle: _textStyle(fontSize),
              weekdayTextStyle: _weekdayTextStyle(fontSize),
              daysTextStyle: _textStyle(fontSize),
              inactiveDaysTextStyle: _disabledTextStyle(fontSize),
              todayButtonColor: AppColors.transparent,
              todayBorderColor: AppColors.transparent,
              todayTextStyle: AppFonts.main.copyWith(
                color: AppColors.background,
                fontWeight: FontWeight.w800,
                fontSize: fontSize + 1,
              ),
              selectedDayButtonColor: AppColors.transparent,
              selectedDayBorderColor: AppColors.transparent,
              selectedDayTextStyle: AppFonts.main.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
                fontSize: fontSize + 1,
              ),
              headerTextStyle: const TextStyle(fontSize: 0),
              showHeader: false,
              selectedDateTime: _selectedDay,
              daysHaveCircularBorder: false,
              locale: 'pt_BR',
              customDayBuilder: (
                bool isSelectable,
                int index,
                bool isSelectedDay,
                bool isToday,
                bool isPrevMonthDay,
                TextStyle? textStyle,
                bool isNextMonthDay,
                bool isThisMonthDay,
                DateTime day,
              ) {
                final bool today = _isToday(day);
                final bool pastOrInvalid = !_isValidDay(day);
                final bool isSelected = _selectedDay != null &&
                    day.day == _selectedDay!.day &&
                    day.month == _selectedDay!.month &&
                    day.year == _selectedDay!.year;

                return Center(
                  child: Container(
                    width: daySize,
                    height: daySize,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.background
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(daySize * 0.25),
                      border: Border.all(
                        color: today
                            ? AppColors.background
                            : isSelected
                                ? AppColors.background
                                : AppColors.primary,
                        width: today || isSelected ? 2 : 0,
                      ),
                    ),
                    child: Text(
                      "${day.day}",
                      style: AppFonts.main.copyWith(
                        color: isSelected
                            ? AppColors.primary
                            : pastOrInvalid
                                ? AppColors.secondaryText
                                : AppColors.background,
                        fontWeight: FontWeight.w900,
                        fontSize: fontSize + 1,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(double fontSize) {
    return AppFonts.main.copyWith(
      color: AppColors.background,
      fontSize: fontSize + 1,
      fontWeight: FontWeight.w900,
    );
  }

  TextStyle _disabledTextStyle(double fontSize) {
    return AppFonts.main.copyWith(
      color: AppColors.secondaryText,
      fontSize: fontSize + 1,
      fontWeight: FontWeight.w800,
    );
  }

  TextStyle _weekdayTextStyle(double fontSize) {
    const weekdays = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
    return AppFonts.main.copyWith(
      color: AppColors.background,
      fontSize: fontSize + 2,
      fontWeight: FontWeight.w900,
    );
  }
}

extension CapitalizeExtension on String {
  String capitalize() =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';
}
