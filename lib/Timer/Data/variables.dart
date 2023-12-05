import 'package:flutter/material.dart';

ValueNotifier <bool> startTimer = ValueNotifier(false);
Stopwatch timer = Stopwatch();
Duration timerDuration = const Duration(minutes: 5);
var cherckerTimer;

void reachedLimit(){
  if (timerDuration.compareTo(timer.elapsed) <= 0 && startTimer.value == true) {
    print('************* reached limit ************');
    resetTimer();
    turnOnSound();
  }
  print('waiting');
}

void resetTimer() {
  startTimer.value = false;
  startTimer.value = true;
  startTimer.value = false;
  timer.stop();
  timer.reset();
  cherckerTimer.cancel();
}

void turnOnSound() {
  //todo: turn on sound
}