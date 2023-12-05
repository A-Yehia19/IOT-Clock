import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widgets/Alarm List.dart';

class Alarms extends StatelessWidget {
  const Alarms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 64.h),
                child: Text('Alarms', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 25.h,),
              const Expanded(child: AlarmList()),
            ]
          ),
        )
      ),
    );
  }
}
