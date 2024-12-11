import 'package:intl/intl.dart';
import 'package:baitap5/data/task_priority.dart';
import 'package:baitap5/data/task_status.dart';

class TaskModel {
  const TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.priority,
    required this.taskStatus,
  });

  final int id;
  final String name;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime date;
  final TaskPriority priority;
  final TaskStatus taskStatus;

  TaskModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? date,
    TaskPriority? priority,
    TaskStatus? taskStatus,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      taskStatus: taskStatus ?? this.taskStatus,
    );
  }
}

extension TaskModelExtension on TaskModel {
  String get displayDate {
    final dateFormat = DateFormat('d MMM');
    return dateFormat.format(date);
  }
}


