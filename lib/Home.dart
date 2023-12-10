import 'package:flutter/material.dart';
import 'package:iot_clock/Alarms/Alarms.dart';
import 'package:iot_clock/MQTT%20modules/Mqtt%20Connect.dart';
import 'package:iot_clock/Settings/settings.dart';
import 'package:iot_clock/Stopwatch/stopwatch.dart';
import 'package:iot_clock/Timer/timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  void initState() {
    mqttConnect();

    super.initState();
  }

  @override
  void dispose() {
   client.disconnect();

    super.dispose();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
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
