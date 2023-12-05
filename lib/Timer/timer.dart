import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Timer/Widgets/Delete%20Button.dart';
import 'package:iot_clock/Timer/Widgets/Play%20Timer.dart';
import 'package:iot_clock/Timer/Widgets/Timer%20Clock.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
                children: [
                  Positioned(
                    left: 17.w,
                    top: 64.h,
                    child: Text('Stopwatch', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                  ),
                  const Center(child: TimerClock()),
                  const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DeleteButton(),
                          PlayTimer(),
                          SizedBox(height: 50, width: 50,)
                        ],
                      )
                  ),
                ]
            ),
          )
      ),
    );
  }
}
