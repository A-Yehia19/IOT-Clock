import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Alarms/Data/variables.dart';

import 'Add Alarm Button.dart';
import 'Alarm Card.dart';

class AlarmList extends StatelessWidget {
  const AlarmList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: alarmCount,
            builder: (BuildContext context, value, Widget? child) => ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: alarmsList.length,
              itemBuilder: (_, index) => AlarmCard(alarm: alarmsList[index],),
              separatorBuilder: (_, index) => SizedBox(height: 15.h,),
            ),
          ),
        ),
        const AddAlarmButton(),
      ]
    );
  }
}
