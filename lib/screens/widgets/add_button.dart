import 'package:baitap5/materias/app_icons.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        width: 60,
        height: 71,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppColors.hexDE83B0,
              AppColors.hexC59ADF,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            AppIcons.plus,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
