import 'package:baitap5/materias/colors_app.dart';
import 'package:baitap5/materias/images.dart';
import 'package:baitap5/screens/widgets/search_field.dart';
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
      title: const Text(
        'You have got 5 tasks\ntoday to complete',
        maxLines: 2,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleSpacing: 20,
      actions: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(22)),
          child: Image.asset(
            AppImages.avatar,
            width: 45,
            height: 45,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
     bottom: PreferredSize(
         preferredSize: const Size.fromHeight(82),
         child: Padding(
             padding: const EdgeInsets.symmetric(
               vertical: 12,
               horizontal: 20,
             ),
           child: SearchField(
               hintText: "Search Task Here",
               onChanged: onSearchChanged,
           ),
         ),
     ),
      centerTitle: false,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
