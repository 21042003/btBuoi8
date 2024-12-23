import 'package:baitap5/materias/app_icons.dart';
import 'package:baitap5/materias/colors_app.dart';
import 'package:flutter/material.dart';


class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
});
  final String hintText;

  final ValueChanged<String> onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField>{
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 16,
        ),
        prefixIcon: SizedBox(
          width: 44,
          child: Center(
            child: Image.asset(
              AppIcons.search,
              width: 20,
              height: 20,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        filled: true,
        fillColor: AppColors.hex181818,
      ),
      onChanged: widget.onChanged,
    );
  }
}