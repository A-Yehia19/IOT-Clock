import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Add Alarm Widgets/ConfirmButton.dart';
import 'Add Alarm Widgets/New Alarm Form.dart';

class AddAlarm extends StatelessWidget {
  const AddAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17.w, top: 64.h),
                        child: Text('Add New Alarm', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 25.h,),
                      const Expanded(child: NewAlarmForm()),
                      const ConfirmButton(),
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }
}
