import 'package:iot_clock/Alarms/Data/variables.dart';
import 'package:iot_clock/Constants/variables.dart';
import 'package:iot_clock/MQTT%20modules/Publish%20Message.dart';

sortAndSend() {
  // sort the alarms list
  alarmsList.sort((a, b) => a.time.compareTo(b.time));

  // send the first alarm to the broker
  String msg;
  if (alarmsList.isEmpty) {
    msg = '     ';
  } else {
    final hours = alarmsList[0].time.hour.toString().padLeft(2, '0');
    final minutes = alarmsList[0].time.minute.toString().padLeft(2, '0');
    msg = '$hours:$minutes';
  }
  publishMessage(alarmTopic, msg);
}
