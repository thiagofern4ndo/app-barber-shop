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

  bool _isValidDay(DateTime day) {
    return day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.month == DateTime.now().month;
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
    final double calendarHeight = size.height * 0.4;
    final double calendarWidth = size.width * 0.9;
    final double padding = size.width * 0.02;
    final double daySize = size.width * 0.08;
    final double fontSize = size.width * 0.03;

    return Container(
      height: calendarHeight,
      width: calendarWidth,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CalendarCarousel(
        onDayPressed: (DateTime date, List events) {
          _selectDay(date);
        },
        weekendTextStyle: _textStyle(fontSize),
        weekdayTextStyle: _textStyle(fontSize),
        daysTextStyle: _textStyle(fontSize),
        inactiveDaysTextStyle: _disabledTextStyle(fontSize),
        todayButtonColor: AppColors.transparent,
        todayBorderColor: AppColors.transparent,
        todayTextStyle: AppFonts.main.copyWith(
          color: AppColors.background,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
        selectedDayButtonColor: AppColors.transparent,
        selectedDayBorderColor: AppColors.transparent,
        selectedDayTextStyle: AppFonts.main.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
        headerTextStyle: _headerTextStyle(size),
        headerText: _formatMonthHeader(),
        leftButtonIcon: Icon(Icons.chevron_left,
            color: AppColors.selectedColor, size: fontSize * 1.5),
        rightButtonIcon: Icon(Icons.chevron_right,
            color: AppColors.selectedColor, size: fontSize * 1.5),
        weekFormat: false,
        showHeaderButton: true,
        selectedDateTime: _selectedDay,
        minSelectedDate: DateTime.now(),
        daysHaveCircularBorder: false,
        locale: 'pt',
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
                color: isSelected ? AppColors.background : AppColors.primary,
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
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextStyle _textStyle(double fontSize) {
    return AppFonts.main.copyWith(
      color: AppColors.background,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _disabledTextStyle(double fontSize) {
    return AppFonts.main.copyWith(
      color: AppColors.secondaryText,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _headerTextStyle(Size size) {
    return AppFonts.main.copyWith(
      color: AppColors.selectedColor,
      fontSize: size.width * 0.05,
      fontWeight: FontWeight.w700,
    );
  }

  String _formatMonthHeader() {
    DateFormat dateFormat = DateFormat('MMMM yyyy', 'pt_BR');
    String formattedDate = dateFormat.format(_selectedDay ?? DateTime.now());
    return formattedDate[0].toUpperCase() + formattedDate.substring(1);
  }
}
