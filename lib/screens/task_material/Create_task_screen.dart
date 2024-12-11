import 'package:baitap5/common_widgets/primary_app_bar.dart';
import 'package:baitap5/common_widgets/primary_button.dart';
import 'package:baitap5/data/task_priority.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/screens/task_material/widgets/calendar_date.dart';
import 'package:baitap5/screens/task_material/widgets/input_field.dart';
import 'package:baitap5/screens/task_material/widgets/priority_item.dart';
import 'package:baitap5/screens/task_material/widgets/time_picker.dart';
import 'package:baitap5/screens/task_material/widgets/toggle_switch.dart';
import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TaskPriority? selectedTaskPriority;

  TimeOfDay? startTime;

  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: PrimaryAppBar(
          title: 'Create new task',
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DatePicker(
                  date: DateTime.now(),
                  selectedDate: DateTime.now(),
                  onDateChanged: (date) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Schedule",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InputField(
                        hintText: "Name",
                        maxLines: 1,
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InputField(
                        hintText: "Description",
                        maxLines: 4,
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TimePicker(
                              title: 'Start Time',
                              onTimeChanged: (time) {
                                setState(() {
                                  startTime = time;
                                });
                              },
                              time: startTime ?? TimeOfDay.now(),
                            ),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          Expanded(
                            child: TimePicker(
                              time: endTime ?? TimeOfDay.now(),
                              title: 'End Time',
                              onTimeChanged: (time) {
                                setState(() {
                                  endTime = time;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PriorityItem(
                        selectedTaskPriority: selectedTaskPriority,
                        taskPriorities: TaskPriority.values,
                        onTaskPriorityChanged: (taskPriority) {
                          setState(() {
                            selectedTaskPriority = taskPriority;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      const ToggleSwitch(),
                      const SizedBox(
                        height: 16,
                      ),
                      PrimaryButton(
                        title: 'Create Task',
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


