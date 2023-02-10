import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';

enum SOUND {
  // ignore: constant_identifier_names
  CONFIRMATION,
  // ignore: constant_identifier_names
  CHECK,
  // ignore: constant_identifier_names
  FAILED
}

class SoundUtil {
  
  // ignore: unused_field
  static String? _soundN = "";

  static Future<void> soundAndVibrate(SOUND soundName) async{

    _soundN = "";
    if (soundName == SOUND.CONFIRMATION){
      _soundN = "mixkit-confirmation-tone-2867.wav";
    } else if (soundName == SOUND.CHECK){
      _soundN = "mixkit-digital-quick-tone-2866.wav";
    } else if (soundName == SOUND.FAILED){
      _soundN = "mixkit-tech-break-fail-2947.wav";
    }

    Vibration.hasVibrator().then((value) async {

      if (value == true) {
        await Vibration.vibrate(duration: 90);
      }
    });

    await FlutterRingtonePlayer.play(
      fromAsset: 'packages/event_crew/assets/sounds/$_soundN',
      ios: IosSounds.glass,
      looping: false, // Android only - API >= 28
      volume: 1.0, // Android only - API >= 28
      asAlarm: false, // Android only - all APIps
    );
  }
}