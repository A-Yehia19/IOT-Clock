import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_clock/Alarms/Alarms.dart';
import 'package:iot_clock/Alarms/Data/variables.dart';
import 'package:iot_clock/Constants/variables.dart';
import 'package:iot_clock/MQTT%20modules/Mqtt%20Connect.dart';
import 'package:iot_clock/MQTT%20modules/Publish%20Message.dart';
import 'package:iot_clock/Stopwatch/stopwatch.dart';
import 'package:iot_clock/Timer/timer.dart';

Timer alarmTimeChecker = Timer.periodic(const Duration(seconds: 1), (timer) {
  if (alarmsList.isNotEmpty && alarmsList[0].isOn) {
    if (alarmsList[0].time.isBefore(DateTime.now())) {
      turnOnSound();
      publishMessage(alarmTopic, 'r');
      alarmsList[0].delete();
    }
  }
});

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  void initState() {
    mqttConnect();
    print(alarmTimeChecker.isActive);

    super.initState();
  }

  @override
  void dispose() {
   client.disconnect();
   alarmTimeChecker.cancel();

    super.dispose();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Alarms(),
      const TimerPage(),
      const StopWatch(),
    ];

    final controller = PageController(
      initialPage: currentPage,
      keepPage: true,
    );

    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (value) => setState(() => currentPage = value),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF232A30),
        selectedItemColor: Colors.white.withOpacity(0.85),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        elevation: 5,
        selectedIconTheme: const IconThemeData(size: 35),
        selectedFontSize: 16,
        currentIndex: currentPage,
        onTap: (value) => setState(() => controller.animateToPage(value, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut)),
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
