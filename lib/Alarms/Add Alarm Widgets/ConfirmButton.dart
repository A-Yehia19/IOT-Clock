import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Alarms/Data/Functions.dart';
import 'package:iot_clock/Alarms/Data/variables.dart';
import 'package:iot_clock/Constants/Colors.dart';

import '../Data/Alarm Class.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160.w,
        height: 60.h,
        margin: EdgeInsets.symmetric(vertical: 25.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: secondaryColor,
        ),
        child: TextButton(
            onPressed: () => confirmAlarm(context),
            child: Text('Confirm', style: TextStyle(fontSize: 23.sp, color: primaryColor, fontWeight: FontWeight.w500),)
        ),
      ),
    );
  }
}

confirmAlarm(context) {
  DateTime finalTime = DateTime(
    date.value.year,
    date.value.month,
    date.value.day,
    time.value.hour,
    time.value.minute,
  );

  if (finalTime.isBefore(DateTime.now())) {
    var snackBar = const SnackBar(content: Text('Alarm time is in the past!, please choose a time in the future :)'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }

  Alarm newAlarm = Alarm(
    isOn: true,
    name: alarmNameController.text,
    time: finalTime,
  );
  alarmsList.add(newAlarm);
  time.value = Time(hour: DateTime.now().hour, minute: DateTime.now().minute);
  date.value = DateTime.now();
  alarmNameController.clear();
  Navigator.pop(context);
  alarmsList[0].notify();

  sortAndSend();
}
