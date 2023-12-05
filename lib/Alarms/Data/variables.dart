import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:iot_clock/Alarms/Data/Alarm%20Class.dart';

List <Alarm> alarmsList = [];

ValueNotifier <int> alarmCount = ValueNotifier(alarmsList.length);

ValueNotifier <Time> time = ValueNotifier(Time(hour: DateTime.now().hour, minute: DateTime.now().minute));
ValueNotifier <DateTime> date = ValueNotifier(DateTime.now());
TextEditingController alarmNameController = TextEditingController();
