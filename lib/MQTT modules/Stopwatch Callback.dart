import '../Stopwatch/Data/variables.dart';

stopwatchCallback(msg) {
  print('******************* stopwatch callback *******************');
  print(msg);
  print('');

  // start stopwatch
  if(msg == 's'){
    stopwatch.start();
    startStopwatch.value = true;
  }

  // pause stopwatch
  else if(msg == 'p'){
    stopwatch.stop();
    startStopwatch.value = false;
  }

  // reset stopwatch
  else if(msg == 'r'){
    stopwatch.stop();
    stopwatch.reset();
    startStopwatch.value = false;
    startStopwatch.value = true;
    startStopwatch.value = false;
  }
}
