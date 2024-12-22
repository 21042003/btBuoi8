
import 'package:baitap5/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeBottomApp extends StatefulWidget {
  const HomeBottomApp({super.key});


  @override
  State<HomeBottomApp> createState() => _HomeBottomAppState();
}

class _HomeBottomAppState extends State<HomeBottomApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.pinkAccent,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black.withOpacity(0.8),
          iconSize: 24,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Placeholder();
      default:
        return const Placeholder();
    }
  }
}
