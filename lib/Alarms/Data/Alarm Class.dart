import 'package:iot_clock/Alarms/Data/variables.dart';

class Alarm{
  final String name;
  final DateTime time;
  late bool isOn;

  Alarm({
    required this.name,
    required this.time,
    required this.isOn,
  });

  void delete(){
    alarmsList.remove(this);
    notify();
  }

  void toggle(){
    isOn = !isOn;
    notify();
  }

  void notify(){
    alarmCount.value += 1;
  }
}