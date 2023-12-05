import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Constants/Colors.dart';
import 'package:iot_clock/Stopwatch/Data/variables.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

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
        valueListenable: startStopwatch,
        builder: (context, value, child) => IconButton(
          onPressed: start,
          icon: Icon(startStopwatch.value ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.black, size: 40.sp),
        ),
      ),
    );
  }
}

start() {
  startStopwatch.value = !startStopwatch.value;
  if (startStopwatch.value) {
    stopwatch.start();
  }else{
    stopwatch.stop();
  }
  print('${startStopwatch.value} ${stopwatch.elapsedMilliseconds}');
}