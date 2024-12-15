import 'package:baitap5/materias/colors_app.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  const Header({
    required this.title,
    required this.onSeeAllTap,
    super.key,
  });

  final String title;

  final VoidCallback onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onSeeAllTap,
            child: const InkWell(
              mouseCursor: SystemMouseCursors.click,
              child: Text(
                'See All',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.hexBA83DE
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
