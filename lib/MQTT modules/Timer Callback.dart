import 'dart:async';

import 'package:iot_clock/Timer/Data/variables.dart';

timerCallback(msg) {
  print('******************* timer callback *******************');
  print(msg);
  print('');

  // start timer
  if(msg == 's'){
    timer.start();
    cherckerTimer = Timer.periodic(const Duration(seconds: 1), (timer) => reachedLimit(),);
    startTimer.value = !startTimer.value;
  }

  // pause timer
  else if(msg == 'p'){
    timer.stop();
    cherckerTimer.cancel();
    startTimer.value = !startTimer.value;
  }

  // reset timer
  else if(msg == 'r'){
    resetTimer();
  }
}
