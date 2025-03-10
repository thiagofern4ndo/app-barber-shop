import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart'; 
import 'package:app_barber_shop/components/theme/colors.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime) aoSelecionarDia;

  const CustomCalendar({Key? key, required this.aoSelecionarDia}) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _selectedDay = DateTime.now();

  bool _isValidDay(DateTime day) {
    return day.isAfter(DateTime.now().subtract(const Duration(days: 1))) && day.month == DateTime.now().month;
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
      height: 320,
      width: 350,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: CalendarCarousel(
        onDayPressed: (DateTime date, List events) {
          _selectDay(date);
        },
        weekendTextStyle: _textStyle(),
        weekdayTextStyle: _textStyle(),
        daysTextStyle: _textStyle(),
        inactiveDaysTextStyle: _disabledTextStyle(),
        todayButtonColor: AppColors.transparent,
        todayBorderColor: AppColors.transparent, 
        todayTextStyle: GoogleFonts.poppins(
          color: AppColors.selectedColor,
          fontWeight: FontWeight.w700,
        ),
        selectedDayButtonColor: AppColors.transparent,
        selectedDayBorderColor: AppColors.transparent,
        selectedDayTextStyle: GoogleFonts.poppins(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w700,
        ),
        headerTextStyle: _headerTextStyle(),
        headerText: _formatMonthHeader(), 
        leftButtonIcon: Icon(Icons.chevron_left, color: AppColors.selectedColor, size: 20),
        rightButtonIcon: Icon(Icons.chevron_right, color: AppColors.selectedColor, size: 20),
        weekFormat: false,
        showHeaderButton: true,
        selectedDateTime: _selectedDay,
        minSelectedDate: DateTime.now(),
        daysHaveCircularBorder: false, 
        locale: 'pt', 
        customDayBuilder: (bool isSelectable, int index, bool isSelectedDay, bool isToday, bool isPrevMonthDay,
            TextStyle? textStyle, bool isNextMonthDay, bool isThisMonthDay, DateTime day) {
          bool isSunday = day.weekday == DateTime.sunday;
          bool isPastDay = !_isValidDay(day);

          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: isSelectedDay
                    ? AppColors.selectedColor
                    : AppColors.transparent, 
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelectedDay || isToday
                      ? AppColors.selectedColor
                      : AppColors.transparent,
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
                      ? AppColors.primaryText
                      : (isSunday || isPastDay ? AppColors.secondaryText : AppColors.selectedColor), 
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
      color: AppColors.selectedColor,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _disabledTextStyle() {
    return GoogleFonts.poppins(
      color: AppColors.secondaryText,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _headerTextStyle() {
    return GoogleFonts.poppins(
      color: AppColors.selectedColor,
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
