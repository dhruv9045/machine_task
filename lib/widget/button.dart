import 'package:flutter/material.dart';
import 'package:machine_task/constants/colors.dart';
import '../controller/schedule_controller.dart';

class DateTimeWidget extends StatelessWidget {
  final ScheduleController controller;
  final String day;
  final int value;
  const DateTimeWidget({
    super.key,
    required this.controller,
    required this.value,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selected.value = value,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.asset3, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            day,
            style: TextStyle(
                color: controller.selected.value == value
                    ? AppColors.primary
                    : AppColors.black),
          ),
        ),
      ),
    );
  }
}
