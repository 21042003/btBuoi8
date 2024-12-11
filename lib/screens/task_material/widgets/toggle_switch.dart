import 'package:baitap5/materias/app_icons.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

//trang thai cua widget
class _ToggleSwitchState extends State<ToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    //sap xep theo chieu ngang
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Get alert for this task',
            style: TextStyle(color: Colors.white)
        ),
        Image.asset(
          AppIcons.click,
          width: 54,
          height: 27,
        ),
      ],
    );
  }
}
