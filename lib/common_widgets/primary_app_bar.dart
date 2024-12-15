import 'package:baitap5/materias/app_icons.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    required this.title,
    required this.onBack,
    super.key,
  });

  final String title;

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.hex020206,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      scrolledUnderElevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      leadingWidth: 68,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GestureDetector(
          onTap: onBack,
          child: SizedBox(
            width: 44,
            height: 44,
            child: InkWell(
              mouseCursor: SystemMouseCursors.click,
              child: Center(
                child: Image.asset(
                  AppIcons.input,
                  width: 29,
                  height: 29,
                ),
              ),
            ),
          ),
        ),
      ),
      titleSpacing: 20,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
