import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_clock/Constants/Colors.dart';
import 'package:iot_clock/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(389, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          title: 'IOT Clock',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            primaryColor: primaryColor,
            fontFamily: 'Rubik',
            useMaterial3: true,
            primaryTextTheme: Typography(platform: TargetPlatform.android).white,
            textTheme: Typography(platform: TargetPlatform.android).white,
          ),
          home: child,
        );
      },
      child: const Home(),
    );
  }
}
