import 'package:baitap5/common_widgets/primary_app_bar.dart' show PrimaryAppBar;
import 'package:baitap5/common_widgets/primary_button.dart';
import 'package:baitap5/data/task_model.dart';
import 'package:baitap5/data/task_priority.dart';
import 'package:baitap5/data/task_status.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/screens/task_material/argument_task/task_screen_arguments.dart';
import 'package:baitap5/screens/task_material/time_of_day.dart';
import 'package:baitap5/screens/task_material/widgets/calendar_date.dart';
import 'package:baitap5/screens/task_material/widgets/input_field.dart';
import 'package:baitap5/screens/task_material/widgets/priority_item.dart';
import 'package:baitap5/screens/task_material/widgets/time_picker.dart';
import 'package:baitap5/screens/task_material/widgets/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CreateTaskScreen extends StatefulWidget {
  static const routeName = '/new-task';

  final TaskScreenArgument arguments;

  const CreateTaskScreen({
    required this.arguments,
    super.key
  });

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TaskPriority? selectedTaskPriority;

  late TimeOfDay startTime;

  late DateTime selectedDate;

  late TimeOfDay endTime;

  String? name;

  String? description;

  // kiem tra xem day co phai la che do chinh sua cong viec khong
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    final taskModel = widget.arguments.taskModel;
    if (taskModel != null) {
      selectedDate = taskModel.date;
      startTime = taskModel.startTime;
      endTime = taskModel.endTime;
      name = taskModel.name;
      description = taskModel.description;
      selectedTaskPriority = taskModel.priority;
      _isEditing = true;
    } else {
      selectedDate = DateTime.now();
      startTime = TimeOfDay.now();
      endTime = startTime.replacing(hour: startTime.hour + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    //widget de bat su kien khi nguoi dung cham vao man hinh
    return GestureDetector(
      onTap: () {
        //An ban phim khi nguoi dung cham vao bat ky vi tri nao tren man hinh
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: PrimaryAppBar(
          title: _isEditing ? 'Edit Task' : 'Create new task',
          onBack: () {
            Navigator.of(context).pop();
          },
        ),

        //noi dung chinh cua man hinh
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //danh sach cac widget con cua column
              children: [
                DatePicker(
                  date: selectedDate,
                  selectedDate: selectedDate ,
                  onDateChanged: (date) {
                    //cap nhat ngay duoc chon
                    setState(() {
                      selectedDate = date;
                    });
                  },
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
                      //nhap ten cong viec
                      InputField(
                        initialValue: name,
                        hintText: "Name",
                        maxLines: 1,
                        onChanged: (value) {
                          //cap nhat ten cong viec
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      //Nhap mo ta cong viec
                      InputField(
                        initialValue: description,
                        hintText: "Description",
                        maxLines: 4,
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
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
                              time: startTime,
                            ),
                          ),

                          const SizedBox(
                            width: 11,
                          ),

                          Expanded(
                            child: TimePicker(
                              time: endTime,
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
                        title: _isEditing ? 'Edit Task' : 'Create Task',
                        //Ham duoc goi ra khi nguoi dung nhan nut
                        onTap: () {
                          debugPrint('Date: $selectedDate');
                          debugPrint('Name: $name');
                           // Dong man hinh tao cong viec moi
                          final newTaskModel = TaskModel(
                            id: const Uuid().v4(),
                            name: name ?? '',
                            description: description ?? '',
                            startTime: startTime,
                            endTime: endTime,
                            date: selectedDate,
                            priority:
                                selectedTaskPriority ?? TaskPriority.medium,
                            taskStatus: TaskStatus.incomplete,
                          );
                          Navigator.of(context).pop(newTaskModel);
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
