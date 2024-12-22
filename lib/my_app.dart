import 'package:baitap5/Home_drawer/Display_tasks.dart';
import 'package:baitap5/Home_drawer/Home_Bottom_App.dart';
import 'package:baitap5/screens/home_screen.dart';
import 'package:baitap5/screens/task_material/Create_task_screen.dart';
import 'package:baitap5/screens/task_material/argument_task/all_tasks_screen_arguments.dart';
import 'package:baitap5/screens/task_material/argument_task/task_screen_arguments.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case CreateTaskScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => CreateTaskScreen(
                arguments: settings.arguments as TaskScreenArgument,
              ),
            );
          case DisplayTasks.routeName:
            return MaterialPageRoute(
              builder: (context) => DisplayTasks(
                arguments: settings.arguments as AllTasksScreenArguments,
              ),
            );
          default:
            return null;
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
