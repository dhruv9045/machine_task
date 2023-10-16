import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants/colors.dart';
import '../constants/utils.dart';
import '../controller/schedule_controller.dart';

class CalendarWidget extends StatelessWidget {
  final ScheduleController controller;
  const CalendarWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      weekNumbersVisible: false,
      headerStyle: HeaderStyle(
          titleCentered: false,
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppColors.primary,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppColors.primary,
          ),
          titleTextStyle: TextStyle(color: AppColors.black)),
      focusedDay: controller.selected.value == 0
          ? controller.focusedDay
          : controller.focusedDay2,
      selectedDayPredicate: (day) => isSameDay(
          controller.selected.value == 0
              ? controller.selectedDay
              : controller.selectedDay2,
          day),
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        weekendTextStyle: TextStyle(color: AppColors.black),
        weekNumberTextStyle: TextStyle(color: AppColors.black),
        selectedTextStyle: TextStyle(color: AppColors.primary),
        todayDecoration: BoxDecoration(),
        defaultTextStyle: TextStyle(color: AppColors.black),
        todayTextStyle: TextStyle(
          color: AppColors.primary,
        ),
        selectedDecoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.2), shape: BoxShape.circle),
        outsideDaysVisible: false,
      ),
      onDaySelected: controller.onSelect,
      onPageChanged: (focusedDay) {
        controller.selected.value == 0
            ? controller.focusedDay
            : controller.focusedDay2 = focusedDay;
      },
      daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) =>
              DateFormat.E(locale).format(date).toUpperCase(),
          weekendStyle: TextStyle(color: AppColors.asset3),
          weekdayStyle: TextStyle(color: AppColors.asset3)),
    );
  }
}
