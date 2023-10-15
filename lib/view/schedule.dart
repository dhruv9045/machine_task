import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machine_task/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constants/utils.dart';

class EventSchedule extends StatefulWidget {
  @override
  _EventScheduleState createState() => _EventScheduleState();
}

class _EventScheduleState extends State<EventSchedule> {
  DateTime _focusedDay = DateTime.now();
  DateTime _focusedDay2 = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _selectedDay2;
  bool isStartDate = true;
  bool isStartTime = true;
  int selected = 0;
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedDay2 = _focusedDay2;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      selected == 0
          ? setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            })
          : selected == 2
              ? setState(() {
                  _selectedDay2 = selectedDay;
                  _focusedDay2 = focusedDay;
                })
              : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "Starts",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  )),
                  GestureDetector(
                    onTap: () => setState(() => selected = 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.asset3,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectDate(_selectedDay),
                          style: TextStyle(
                              color: selected == 0
                                  ? AppColors.primary
                                  : AppColors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selected = 1),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.asset3,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectTime(_selectedDay),
                          style: TextStyle(
                              color: selected == 1
                                  ? AppColors.primary
                                  : AppColors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            selected == 0 || selected == 1
                ? Divider(
                    thickness: 1,
                    indent: 12,
                    color: AppColors.asset3,
                  )
                : Container(),
            selected == 0
                ? TableCalendar(
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
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
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
                          color: AppColors.primary.withOpacity(0.2),
                          shape: BoxShape.circle),
                      outsideDaysVisible: false,
                    ),
                    onDaySelected: _onDaySelected,
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    daysOfWeekStyle: DaysOfWeekStyle(
                        dowTextFormatter: (date, locale) =>
                            DateFormat.E(locale).format(date).toUpperCase(),
                        weekendStyle: TextStyle(color: AppColors.asset3),
                        weekdayStyle: TextStyle(color: AppColors.asset3)),
                  )
                : Container(),
            selected == 1
                ? SizedBox(
                    height: 200, // You can adjust the height as needed
                    child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      onTimerDurationChanged: (newTime) {
                        setState(() {
                          _selectedDay = DateTime(
                            _selectedDay!.year,
                            _selectedDay!.month,
                            _selectedDay!.day,
                            newTime.inDays,
                            newTime.inMinutes,
                          );
                        });
                      },
                      initialTimerDuration: Duration(
                          hours: _selectedDay!.hour,
                          minutes: _selectedDay!.minute),
                    ),
                  )
                : Container(),
            Divider(
              thickness: 1,
              indent: 12,
              color: AppColors.asset3,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "Ends",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  )),
                  GestureDetector(
                    onTap: () => setState(() => selected = 2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.asset3,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectDate(_selectedDay2),
                          style: TextStyle(
                              color: selected == 2
                                  ? AppColors.primary
                                  : AppColors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selected = 3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.asset3,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectTime(_selectedDay2),
                          style: TextStyle(
                              color: selected == 3
                                  ? AppColors.primary
                                  : AppColors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            selected == 2 || selected == 3
                ? Divider(
                    thickness: 1,
                    indent: 12,
                    color: AppColors.asset3,
                  )
                : Container(),
            selected == 2
                ? TableCalendar(
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
                    focusedDay: _focusedDay2,
                    selectedDayPredicate: (day) =>
                        isSameDay(_selectedDay2, day),
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
                          color: AppColors.primary.withOpacity(0.2),
                          shape: BoxShape.circle),
                      outsideDaysVisible: false,
                    ),
                    onDaySelected: _onDaySelected,
                    onPageChanged: (focusedDay) {
                      _focusedDay2 = focusedDay;
                    },
                    daysOfWeekStyle: DaysOfWeekStyle(
                        dowTextFormatter: (date, locale) =>
                            DateFormat.E(locale).format(date).toUpperCase(),
                        weekendStyle: TextStyle(color: AppColors.asset3),
                        weekdayStyle: TextStyle(color: AppColors.asset3)),
                  )
                : Container(),
            selected == 3
                ? SizedBox(
                    height: 200, // You can adjust the height as needed
                    child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      onTimerDurationChanged: (newTime) {
                        setState(() {
                          _selectedDay2 = DateTime(
                            _selectedDay2!.year,
                            _selectedDay2!.month,
                            _selectedDay2!.day,
                            newTime.inDays,
                            newTime.inMinutes,
                          );
                        });
                      },
                      initialTimerDuration: Duration(
                          hours: _selectedDay2!.hour,
                          minutes: _selectedDay2!.minute),
                    ),
                  )
                : Container(),
            Text("Check Date Time"),
            ElevatedButton(
                onPressed: () {
                  _selectedDay2!.isBefore(_selectedDay!)
                      ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                              'Start dateTime must be smaller than End dateTime '),
                        ))
                      : null;
                },
                child: Text("Check"))
          ],
        ),
      ),
    );
  }
}
