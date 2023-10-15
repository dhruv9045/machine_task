import 'package:get/get.dart';

class ScheduleController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime focusedDay2 = DateTime.now();
  DateTime? selectedDay;
  DateTime? selectedDay2;
  bool isStartDate = true;
  bool isStartTime = true;
  int selected = 0;
}
