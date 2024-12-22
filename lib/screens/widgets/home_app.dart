import 'package:baitap5/materias/app_icons.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/materias/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    required this.onSearchChanged,
    super.key,
  });

  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.hex020206,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Stack(
        children: [
          const Text(
          'You have got 5 tasks\ntoday to complete',
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
          Positioned(
            bottom: 0,
            right: 0,
            top: 30,
            child: Image.asset(
              AppIcons.pen,
              width: 23,
              height: 22,
            ),
          )
      ],
      ),
      titleSpacing: 20,
      actions: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              child: Image.asset(
                AppImages.avatar,
                width: 45,
                height: 45,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                AppIcons.number,
                width: 15,
                height: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
