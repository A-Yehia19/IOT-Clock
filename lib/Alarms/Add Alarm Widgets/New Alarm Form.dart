import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/Colors.dart';
import '../Data/variables.dart';

class NewAlarmForm extends StatelessWidget {
  const NewAlarmForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h,),Text('Name:', style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),),
        SizedBox(height: 20.h,),
        Container(
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[200],
          ),
          child: Center(
            child: TextField(
              controller: alarmNameController,
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500, color: primaryColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20.w),
                hintText: 'Alarm Name',
                hintStyle: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500, color: primaryColor),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        Text('Time:', style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),),
        SizedBox(height: 20.h,),
        GestureDetector(
          onTap: () {
            openDatePicker(context);
          },
          child: Container(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey[200],
            ),
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: date,
                builder: (context, value, child) => Text(
                  '${date.value.day}/${date.value.month}/${date.value.year}',
                  style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500, color: primaryColor),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        GestureDetector(
          onTap: () {
            openTimePicker(context);
          },
          child: Container(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey[200],
            ),
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: time,
                builder: (context, value, child) => Text(
                  "${time.value.hour.toString().padLeft(2, '0')}:${time.value.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500, color: primaryColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

openTimePicker(BuildContext context) {
  Navigator.of(context).push(
    showPicker(
      context: context,
      value: time.value,
      duskSpanInMinutes: 120,
      is24HrFormat: true,
      elevation: 10,
      blurredBackground: true,
      barrierDismissible: true,
      onChange: (value) {
        time.value = value;
      },
    ),
  );
}

Future<void> openDatePicker(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date.value,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
  );

  if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
  }
}