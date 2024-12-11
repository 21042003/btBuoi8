
import 'package:baitap5/screens/home_screen.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-Do List',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
