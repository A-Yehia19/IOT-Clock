import 'package:just_audio/just_audio.dart';

const alarmMusic = 'Assets/Sounds/alarm_short.mp3';

turnOnSound() async {
  final player1 = AudioPlayer();
  await player1.setAsset(alarmMusic);
  player1.play();
  print("Sound is playing");
}