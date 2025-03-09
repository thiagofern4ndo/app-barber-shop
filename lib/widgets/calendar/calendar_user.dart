import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime) aoSelecionarDia;
  final void Function(dynamic args) onSelectionChanged;

  const CustomCalendar({
    Key? key,
    required this.aoSelecionarDia,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _selectedDay = DateTime.now();
  static const _calendarColor = Color(0xFF00FFB4);
  static const _selectedColor = Color(0xFF000000);
  static const _disabledColor = Color(0xFFB0B0B0);

  bool _isValidDay(DateTime day) {
    return day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.month == DateTime.now().month;
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
    return Container(
      decoration: BoxDecoration(
        color: _calendarColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: CalendarCarousel(
        onDayPressed: (
          DateTime date,
          List events,
        ) {
          _selectDay(date);
        },
        weekendTextStyle: _textStyle(),
        weekdayTextStyle: _textStyle(),
        daysTextStyle: _textStyle(),
        inactiveDaysTextStyle: _disabledTextStyle(),
        todayButtonColor: Colors.transparent,
        todayBorderColor: Colors.transparent,
        todayTextStyle: GoogleFonts.poppins(
          color: _selectedColor,
          fontWeight: FontWeight.w700,
        ),
        selectedDayButtonColor: Colors.transparent,
        selectedDayBorderColor: Colors.transparent,
        selectedDayTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        headerTextStyle: _headerTextStyle(),
        headerText: _formatMonthHeader(),
        leftButtonIcon:
            const Icon(Icons.chevron_left, color: _selectedColor, size: 20),
        rightButtonIcon:
            const Icon(Icons.chevron_right, color: _selectedColor, size: 20),
        weekFormat: false,
        showHeaderButton: true,
        selectedDateTime: _selectedDay,
        targetDateTime: _selectedDay, // Centraliza a data selecionada
        minSelectedDate: DateTime.now(),
        daysHaveCircularBorder: false,
        locale: 'pt',
        customDayBuilder: (bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle? textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day) {
          bool isSunday = day.weekday == DateTime.sunday;
          bool isPastDay = !_isValidDay(day);

          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: isSelectedDay ? _selectedColor : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelectedDay || isToday
                      ? _selectedColor
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: Text(
                "${day.day}",
                style: GoogleFonts.poppins(
                  color: isSelectedDay
                      ? Colors.white
                      : (isSunday || isPastDay
                          ? _disabledColor
                          : _selectedColor),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextStyle _textStyle() {
    return GoogleFonts.poppins(
      color: _selectedColor,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _disabledTextStyle() {
    return GoogleFonts.poppins(
      color: _disabledColor,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _headerTextStyle() {
    return GoogleFonts.poppins(
      color: _selectedColor,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  String _formatMonthHeader() {
    DateFormat dateFormat = DateFormat('MMMM yyyy', 'pt_BR');
    String formattedDate = dateFormat.format(_selectedDay);
    return formattedDate[0].toUpperCase() + formattedDate.substring(1);
  }
}
