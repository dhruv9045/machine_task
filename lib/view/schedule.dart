import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_task/constants/colors.dart';
import 'package:machine_task/controller/schedule_controller.dart';
import 'package:machine_task/widget/time.dart';
import '../../constants/utils.dart';
import '../widget/button.dart';
import '../widget/calendar.dart';

class EventSchedule extends StatelessWidget {
  EventSchedule({super.key});
  ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: ScheduleController(),
          builder: (scheduleController) {
            return Obx(
              () => SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Text(
                            "Starts",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          )),
                          DateTimeWidget(
                              controller: scheduleController,
                              value: 0,
                              day: selectDate(scheduleController.selectedDay)),
                          const SizedBox(
                            width: 10,
                          ),
                          DateTimeWidget(
                            controller: scheduleController,
                            value: 1,
                            day: selectTime(scheduleController.selectedDay),
                          ),
                        ],
                      ),
                    ),
                    scheduleController.selected.value == 0 ||
                            scheduleController.selected.value == 1
                        ? const Divider(
                            thickness: 1,
                            indent: 12,
                            color: AppColors.asset3,
                          )
                        : Container(),
                    scheduleController.selected.value == 0
                        ? CalendarWidget(controller: scheduleController)
                        : Container(),
                    scheduleController.selected.value == 1
                        ? TimeWidget(controller: scheduleController)
                        : Container(),
                    const Divider(
                      thickness: 1,
                      indent: 12,
                      color: AppColors.asset3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Text(
                            "Ends",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          )),
                          DateTimeWidget(
                            controller: scheduleController,
                            value: 2,
                            day: selectDate(scheduleController.selectedDay2),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          DateTimeWidget(
                            controller: scheduleController,
                            value: 3,
                            day: selectTime(scheduleController.selectedDay2),
                          ),
                        ],
                      ),
                    ),
                    scheduleController.selected.value == 2 ||
                            scheduleController.selected.value == 3
                        ? const Divider(
                            thickness: 1,
                            indent: 12,
                            color: AppColors.asset3,
                          )
                        : Container(),
                    scheduleController.selected.value == 2
                        ? CalendarWidget(controller: scheduleController)
                        : Container(),
                    scheduleController.selected.value == 3
                        ? TimeWidget(controller: scheduleController)
                        : Container(),
                    const Text(
                      "Check Date Time",
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          scheduleController.selectedDay2!
                                  .isBefore(scheduleController.selectedDay!)
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  content: Text(
                                      'Start dateTime must be smaller than End dateTime '),
                                ))
                              : null;
                        },
                        child: const Text("Check"))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
