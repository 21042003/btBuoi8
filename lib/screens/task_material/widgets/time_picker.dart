import 'package:baitap5/materias/app_icons.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/screens/task_material/Create_task_screen.dart';
import 'package:baitap5/screens/task_material/time_of_day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  final String title;

  final TimeOfDay time;

  final ValueChanged<TimeOfDay> onTimeChanged;

  const TimePicker({
    super.key,
    required this.title,
    required this.time,
    required this.onTimeChanged,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.time.formatTimeOfDay();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          readOnly: true,
          onTap: () async {
            final selectedTime = await showTimePicker(
              initialTime: widget.time,
              context: context,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      alwaysUse24HourFormat: false,
                    ),
                    child: child!,
                  ),
                );
              },
            );
            if (selectedTime != null) {
              widget.onTimeChanged.call(selectedTime);
              controller.text = selectedTime.formatTimeOfDay();
            }
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
            prefixIcon: SizedBox(
              width: 44,

              child: Center(
                child: Image.asset(
                  AppIcons.clock,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppColors.hex181818,
          ),
        ),
      ],
    );
  }
}