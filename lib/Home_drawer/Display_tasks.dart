import 'package:baitap5/common_widgets/primary_app_bar.dart';
import 'package:baitap5/data/task_model.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/screens/task_material/argument_task/all_tasks_screen_arguments.dart';
import 'package:baitap5/screens/task_material/argument_task/task_screen_arguments.dart';
import 'package:baitap5/screens/widgets/task_item.dart';
import 'package:flutter/material.dart';

class DisplayTasks extends StatefulWidget {
  static const routeName = '/all-tasks';

  const DisplayTasks({
    super.key,
    required this.arguments,
  });

  final AllTasksScreenArguments arguments;

  @override
  State<DisplayTasks> createState() => _DisplayTasksState();
}

class _DisplayTasksState extends State<DisplayTasks> {
  late List<TaskModel> allTasks;

  @override
  void initState() {
    super.initState();
    allTasks = widget.arguments.tasks;
  }

  @override
  Widget build(BuildContext context) {

    final todayTasks = allTasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now(),
      );
    }).toList();

    final tomorrowTasks = allTasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now().add(
          const Duration(days: 1),
        ),
      );
    }).toList();

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.hex020206,
          appBar: PrimaryAppBar(
            title: 'All Tasks',
            onBack: () {
              Navigator.of(context).pop();
            },
          ),
          body: Column(
            children: [
              const TabBar(
                indicatorColor: AppColors.hexDE83B0,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.hexDE83B0,

                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Today'),
                  Tab(text: 'Tomorrow'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                  _buildTabBarContentView(tasks: allTasks),
                  _buildTabBarContentView(tasks: todayTasks),
                  _buildTabBarContentView(tasks: tomorrowTasks),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _buildTabBarContentView({
    required List<TaskModel> tasks,
  }) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        return TaskItem(
          taskModel: tasks[index],
          onStatusChanged: (taskStatus) {},
          onTap: () {  },
        );
      },
      itemCount: tasks.length,
    );
  }
}
