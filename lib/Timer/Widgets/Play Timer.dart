import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Constants/Colors.dart';
import 'package:iot_clock/Timer/Data/variables.dart';

class PlayTimer extends StatelessWidget {
  const PlayTimer({super.key});

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
      child: ValueListenableBuilder(
        valueListenable: startTimer,
        builder: (context, value, child) => IconButton(
          onPressed: start,
          icon: Icon(startTimer.value ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.black, size: 40.sp),
        ),
      ),
    );
  }
}

start() {
  startTimer.value = !startTimer.value;
  if (startTimer.value) {
    timer.start();
    cherckerTimer = Timer.periodic(const Duration(seconds: 1), (timer) => reachedLimit(),);
  }else{
    timer.stop();
    cherckerTimer.cancel();
  }
}