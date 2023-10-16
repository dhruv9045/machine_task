import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime focusedDay2 = DateTime.now();
  DateTime? selectedDay;
  DateTime? selectedDay2;
  bool isStartDate = true;
  bool isStartTime = true;
  RxInt selected = 0.obs;

  @override
  void onInit() {
    selectedDay = focusedDay;
    selectedDay2 = focusedDay2;
    super.onInit();
  }

  onSelect(DateTime selectedDate, DateTime focusedDate) {
    switch (selected.value) {
      case 0:
        if (!isSameDay(selectedDay, selectedDate)) {
          selectedDay = selectedDate;
          focusedDay = focusedDate;
          update();
        }
        break;
      case 2:
        if (!isSameDay(selectedDay2, selectedDate)) {
          selectedDay2 = selectedDate;
          focusedDay2 = focusedDate;
          update();
        }
        break;
    }
  }

  onTime(newTime) {
    switch (selected.value) {
      case 1:
        selectedDay = DateTime(
          selectedDay!.year,
          selectedDay!.month,
          selectedDay!.day,
          newTime.inDays,
          newTime.inMinutes,
        );
        update();
        break;
      case 3:
        selectedDay2 = DateTime(
          selectedDay2!.year,
          selectedDay2!.month,
          selectedDay2!.day,
          newTime.inDays,
          newTime.inMinutes,
        );
        update();
        break;
    }
  }
}
