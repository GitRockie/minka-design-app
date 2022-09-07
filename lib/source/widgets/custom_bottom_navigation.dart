import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pinkAccent,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined), label: 'Event'),
        BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined), label: 'Project'),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined), label: 'Work'),
      ],
    );
  }
}
