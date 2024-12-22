import 'package:baitap5/Home_drawer/Display_tasks.dart';
import 'package:baitap5/Home_drawer/Home_Bottom_App.dart';
import 'package:baitap5/data/task_model.dart';
import 'package:baitap5/data/task_priority.dart';
import 'package:baitap5/data/task_status.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/screens/task_material/Create_task_screen.dart';
import 'package:baitap5/screens/task_material/argument_task/all_tasks_screen_arguments.dart';
import 'package:baitap5/screens/task_material/argument_task/task_screen_arguments.dart';
import 'package:baitap5/screens/widgets/add_button.dart';
import 'package:baitap5/screens/widgets/header.dart';
import 'package:baitap5/screens/widgets/home_app.dart';
import 'package:baitap5/screens/widgets/progress_bar.dart';
import 'package:baitap5/screens/widgets/search_field.dart';
import 'package:baitap5/screens/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tasks = <TaskModel>[
    TaskModel(
      id: const Uuid().v4(),
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 9, minute: 0),
      date: DateTime.now(),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now(),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                  child: SearchField(
                    hintText: 'Search Task Here',
                    onChanged: (value) {
                      debugPrint("Search text changed: $value");
                    },
                  ),
                ),
                Header(
                  title: 'Progress',
                  onSeeAllTap: () {
                    _navigateToDisplayTasks();
                  },
                ),
                Progress(
                  numberOfCompletedTask: numberOfCompletedTodayTask,
                  numberOfTasks: todayTasks.length,
                ),
                Header(
                  title: "Today's Task",
                  onSeeAllTap: () {
                    _navigateToDisplayTasks();
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
                      onTap: () {
                        _navigateToNewTaskScreen(
                          taskModel: todayTasks[index],
                        );
                      },
                    );
                  },
                  // Cap nhat trang thai cong viec trong danh sach
                  itemCount: todayTasks.length,
                  shrinkWrap: true,
                ),
                Header(
                  title: "Tomorrow Task",
                  onSeeAllTap: () {
                    _navigateToDisplayTasks();
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
                      onTap: () {
                        _navigateToNewTaskScreen(
                          taskModel: tomorrowTasks[index],
                        );
                      },
                    );
                  },
                  itemCount: tomorrowTasks.length,
                  shrinkWrap: true,
                ),
                const SizedBox(
                  height: 100,
                ),
                // const HomeBottomApp(),
              ],
            ),
          ),
        ),
        floatingActionButton: AddButton(
          onTap: () async {
            // final newTaskModel = await Navigator.of(context).push(
            _navigateToNewTaskScreen();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }

  Future<void> _navigateToDisplayTasks() async {
    await Navigator.of(context).pushNamed(
      DisplayTasks.routeName,
      arguments: AllTasksScreenArguments(
        tasks: tasks,
      ),
    );
  }

  Future<void> _navigateToNewTaskScreen({TaskModel? taskModel}) async {
    final newTaskModel = await Navigator.of(context).pushNamed(
      CreateTaskScreen.routeName,
      arguments: TaskScreenArgument(
        taskModel: taskModel,
      ),
    ) as TaskModel?;

    if (newTaskModel == null) {
      return;
    }

    setState(() {
      if (taskModel != null) {
        final taskIndex = tasks.indexWhere((e) => e.id == taskModel.id);
        tasks[taskIndex] = newTaskModel;
      } else {
        tasks.add(newTaskModel);
      }
    });
  }
}
