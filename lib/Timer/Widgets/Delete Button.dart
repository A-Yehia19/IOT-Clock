import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Constants/Colors.dart';
import 'package:iot_clock/Constants/variables.dart';
import 'package:iot_clock/MQTT%20modules/Publish%20Message.dart';
import 'package:iot_clock/Timer/Data/variables.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: startTimer,
      builder: (context, value, child) => AnimatedOpacity(
        opacity: timer.elapsedMilliseconds > 0 ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(0, timer.elapsedMilliseconds > 0 ? 0 : 100.h, 0),
          child: child,
        ),
      ),
      child: Container(
        width: 50.r,
        height: 50.r,
        margin: EdgeInsets.symmetric(vertical: 50.h),
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
          onPressed: () => publishMessage(timerTopic, 'r'),
          icon: Icon(Icons.delete_outline, color: Colors.black, size: 30.sp),
        ),
      ),
    );
  }
}