
import 'package:baitap5/Home_drawer/Home_Bottom_App.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-Do List',
      home: HomeBottomApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
