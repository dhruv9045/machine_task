import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/schedule_controller.dart';

class TimeWidget extends StatelessWidget {
  final ScheduleController controller;
  const TimeWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // You can adjust the height as needed
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hm,
        onTimerDurationChanged: controller.onTime,
        initialTimerDuration: Duration(
            hours: controller.selected.value == 1
                ? controller.selectedDay!.hour
                : controller.selectedDay2!.hour,
            minutes: controller.selected.value == 1
                ? controller.selectedDay!.minute
                : controller.selectedDay2!.minute),
      ),
    );
  }
}
