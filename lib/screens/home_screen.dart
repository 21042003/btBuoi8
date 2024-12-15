import 'package:baitap5/Home_drawer/Display_tasks.dart';
import 'package:baitap5/data/task_model.dart';
import 'package:baitap5/data/task_priority.dart';
import 'package:baitap5/data/task_status.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/screens/widgets/header.dart';
import 'package:baitap5/screens/widgets/home_app.dart';
import 'package:baitap5/screens/widgets/progress_bar.dart';
import 'package:baitap5/screens/widgets/task_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tasks = <TaskModel>[
    TaskModel(
      id: 1,
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 2,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 3,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
    TaskModel(
      id: 4,
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 5,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 6,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final todayTasks = tasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now(),
      );
    }).toList();

    final tomorrowTasks = tasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now().add(
          const Duration(days: 1),
        ),
      );
    }).toList();

    final numberOfCompletedTodayTask = todayTasks.where((task) {
      return task.taskStatus == TaskStatus.complete;
    }).length;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: HomeAppBar(
          onSearchChanged: (value) {
            debugPrint("Search text changed: $value");
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                ),
                Header(
                  title: 'Progress',
                  onSeeAllTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplayTasks(
                          tasks: tasks,
                        ),
                      ),
                    );
                  },
                ),
                Progress(
                  numberOfCompletedTask: numberOfCompletedTodayTask,
                  numberOfTasks: todayTasks.length,
                ),
                Header(
                  title: "Today's Task",
                  onSeeAllTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplayTasks(
                          tasks: tasks,
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TaskItem(
                      taskModel: todayTasks[index],
                      onStatusChanged: (taskStatus) {
                        final taskIndex = tasks.indexWhere(
                          (e) => e.id == todayTasks[index].id,
                        );
                        setState(() {
                          tasks[taskIndex] = todayTasks[index]
                              .copyWith(taskStatus: taskStatus);
                        });
                      },
                    );
                  },
                  itemCount: todayTasks.length,
                  shrinkWrap: true,
                ),
                Header(
                  title: "Tomorrow Task",
                  onSeeAllTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplayTasks(
                          tasks: tasks,
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TaskItem(
                      taskModel: tomorrowTasks[index],
                      onStatusChanged: (taskStatus) {
                        final taskIndex = tasks.indexWhere(
                          (e) => e.id == tomorrowTasks[index].id,
                        );
                        setState(() {
                          tasks[taskIndex] = tomorrowTasks[index]
                              .copyWith(taskStatus: taskStatus);
                        });
                      },
                    );
                  },
                  itemCount: tomorrowTasks.length,
                  shrinkWrap: true,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
