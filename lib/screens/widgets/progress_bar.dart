import 'package:baitap5/materias/colors_app.dart';
import 'package:flutter/material.dart';



class Progress extends StatelessWidget {
  final int numberOfCompletedTask;

  final int numberOfTasks;

  const Progress({
    super.key,
    required this.numberOfCompletedTask,
    required this.numberOfTasks,

  });

  @override
  Widget build(BuildContext context) {
    final progressBarWidth = MediaQuery.of(context).size.width - 2 * (20 + 20);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.hex181818,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Daily Task',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$numberOfCompletedTask/$numberOfTasks Task Completed',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'You are almost done go ahead',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ),
               Text(
                '${(numberOfCompletedTask / numberOfTasks * 100).floor()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              // LinearProgressIndicator(
              //   value: 0.66,
              //   backgroundColor: Colors.grey[700],
              //   color: Colors.purple,
              // ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Stack(
            children: [
            Container(
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.hexBA83DE.withOpacity(0.41),
              ),
            ),
              Container(
                height: 18,
                width: progressBarWidth * numberOfCompletedTask / numberOfTasks,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.hexBA83DE,
                ),
              ),
           ],
          ),
        ],
      ),
    );
  }
}
