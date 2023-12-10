import 'package:iot_clock/Alarms/Data/variables.dart';
import 'package:iot_clock/Constants/variables.dart';
import 'package:iot_clock/MQTT%20modules/Publish%20Message.dart';

sortAndSend() {
  // sort the alarms list
  alarmsList.sort((a, b) => a.time.compareTo(b.time));
  alarmsList.sort((a, b) => a.isOn == false ? 1 : -1);

  // send the first alarm to the broker
  String msg;
  if (alarmsList.isEmpty || !alarmsList[0].isOn) {
    msg = '  Alarm is not set  ';
  } else {
    final hours = alarmsList[0].time.hour.toString().padLeft(2, '0');
    final minutes = alarmsList[0].time.minute.toString().padLeft(2, '0');
    msg = 'Alarm set at = $hours:$minutes';
  }
  publishMessage(alarmTopic, msg);
}
