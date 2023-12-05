import 'package:flutter/material.dart';
import 'package:iot_clock/Alarms/Alarms.dart';
import 'package:iot_clock/Settings/settings.dart';

import 'Stopwatch/stopwatch.dart';
import 'Timer/timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const Alarms(),
      const TimerPage(),
      const StopWatch(),
      const Settings(),
    ];
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF232A30),
        selectedItemColor: Colors.white.withOpacity(0.85),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        elevation: 5,
        selectedIconTheme: const IconThemeData(size: 35),
        selectedFontSize: 16,
        currentIndex: currentPage,
        onTap: (value) => setState(() => currentPage = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Stop Watch',
          ),
        ],
      ),
    );
  }
}