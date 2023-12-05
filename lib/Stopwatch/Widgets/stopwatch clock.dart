import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Constants/Colors.dart';
import 'package:iot_clock/Stopwatch/Data/variables.dart';

class StopwatchClock extends StatelessWidget {
  const StopwatchClock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.r,
      height: 300.r,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(
              BorderSide(
                color: textColor,
                width: 10,
              ),
            ),
          ),
          child: Center(
            child: StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) => Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${stopwatch.elapsedMilliseconds ~/ 6000}'.padLeft(2, '0'),
                    ),
                    TextSpan(
                      text: ' ${'${stopwatch.elapsedMilliseconds ~/ 1000 % 60}'.padLeft(2, '0')}',
                      style: TextStyle(fontSize: 35.sp),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: 75.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
