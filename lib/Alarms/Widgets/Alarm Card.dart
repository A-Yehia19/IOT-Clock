import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Alarms/Data/Alarm%20Class.dart';
import 'package:iot_clock/Alarms/Data/Functions.dart';
import 'package:iot_clock/Constants/Colors.dart';

class AlarmCard extends StatelessWidget {
  final Alarm alarm;
  const AlarmCard({super.key, required this.alarm});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(-2, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: alarm.isOn ? textColor : textColorDisabled,
                ),
                children: [
                  TextSpan(
                    text: "${alarm.time.hour.toString().padLeft(2, '0')}:${alarm.time.minute.toString().padLeft(2, '0')}",
                  ),
                  TextSpan(
                    text: "   ${alarm.time.day.toString().padLeft(2, '0')}/${alarm.time.month.toString().padLeft(2, '0')}",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Text(
              alarm.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: alarm.isOn ? textColor : textColorDisabled,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => alarm.delete(),
              icon: const Icon(Icons.delete),
              color: textColorDisabled,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Switch(
              value: alarm.isOn,
              onChanged: (bool state) => alarm.toggle(),
              activeColor: textColor,
              activeTrackColor: secondaryColor.withOpacity(0.7),
              inactiveThumbColor: textColorDisabled,
              inactiveTrackColor: textColorDisabled.withOpacity(0.5),
            ),
          ),
        ]
      ),
    );
  }
}
