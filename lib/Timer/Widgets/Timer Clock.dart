import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Constants/Colors.dart';
import 'package:iot_clock/Timer/Data/variables.dart';

class TimerClock extends StatelessWidget {
  const TimerClock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.r,
      height: 300.r,
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 300.r,
              height: 300.r,
              child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 10)),
                builder: (context, snapshot) => CircularProgressIndicator(
                  value: timer.elapsedMilliseconds / timerDuration.inMilliseconds,
                  strokeWidth: 10,
                  color: secondaryColor,
                  backgroundColor: textColor,
                  strokeCap: StrokeCap.round,
                  valueColor: const AlwaysStoppedAnimation<Color>(secondaryColor),
                ),
              ),
            ),
            Center(
              child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  int hours = (timerDuration.inMilliseconds - timer.elapsedMilliseconds) ~/ 1000 ~/ 60 ~/ 60;
                  int minutes = (timerDuration.inMilliseconds - timer.elapsedMilliseconds) ~/ 1000 ~/ 60 % 60;
                  return InkWell(
                    onTap: () => openPicker(context),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$hours'.padLeft(2, '0'),
                          ),
                          TextSpan(
                            text: ' ${'$minutes'.padLeft(2, '0')}',
                            style: TextStyle(fontSize: 35.sp),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 75.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

openPicker(context) async {
  final hours = timerDuration.inHours;
  final minutes = timerDuration.inMinutes % 60;
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: hours, minute: minutes),
    initialEntryMode: TimePickerEntryMode.input,
    helpText: 'Select timer duration',
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onSurface: Colors.purple,
          ),
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        ),
      );
    },
  );

  if (selectedTime != null){
    timerDuration = Duration(hours: selectedTime.hour, minutes: selectedTime.minute);
  }
}
