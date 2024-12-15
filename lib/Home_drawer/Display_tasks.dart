import 'package:baitap5/common_widgets/primary_app_bar.dart';
import 'package:baitap5/data/task_model.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/screens/widgets/task_item.dart';
import 'package:flutter/material.dart';

class DisplayTasks extends StatefulWidget {
  final List<TaskModel> tasks;

  const DisplayTasks({
    super.key,
    required this.tasks,
  });

  @override
  State<DisplayTasks> createState() => _DisplayTasksState();
}

class _DisplayTasksState extends State<DisplayTasks> {
  @override
  Widget build(BuildContext context) {
    final allTasks = widget.tasks;

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
                indicatorColor: AppColors.hexD7F0FF,
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
                child: TabBarView(children: [
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
        );
      },
      itemCount: tasks.length,
    );
  }
}
