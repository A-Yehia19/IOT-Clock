import 'package:iot_clock/Alarms/Data/Functions.dart';
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
    sortAndSend();
    notify();
  }

  void toggle(){
    isOn = !isOn;
    sortAndSend();
    notify();
  }

  void notify(){
    alarmCount.value += 1;
  }
}