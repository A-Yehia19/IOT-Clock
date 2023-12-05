import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Alarms/Add%20Alarm.dart';
import 'package:iot_clock/Constants/Colors.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.r,
      height: 100.r,
      margin: EdgeInsets.symmetric(vertical: 25.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(-2, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () => Navigator.of(context).push(PageAnimationTransition(page: const AddAlarm(), pageAnimationType: RightToLeftTransition())),
        icon: Icon(Icons.add, color: Colors.black, size: 40.sp),
      ),
    );
  }
}
