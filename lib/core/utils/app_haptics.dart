// Simple class wrapping HapticFeedback to make testing a bit simpler.

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/services/common/platform_info.dart';

/// simple and minimalistic action-based journal
class AppHaptics {
  // note: system sounds are pretty buggy on Android: https://github.com/flutter/flutter/issues/57531
  ///Debug Sound Haptics for App
  static bool debugSound = kDebugMode && enableDebugLogs;

  ///Debug Log Haptics for App
  static bool debugLog = kDebugMode && enableDebugLogs;

  ///Debug Sound Haptics for App
  static bool enableDebugLogs = false;

  ///Button Press Haptics for App
  static void buttonPress() {
    // Android/Fuchsia expect haptics on all button presses, iOS does not.
    if (PlatformInfo.isAndroid) {
      lightImpact();
    }
  }

  ///Light impact Haptics for App
  static Future<void> lightImpact() {
    _debug('lightImpact');
    return HapticFeedback.lightImpact();
  }

  ///Medium impact Haptics for App
  static Future<void> mediumImpact() {
    _debug('mediumImpact');
    return HapticFeedback.mediumImpact();
  }

  ///Heavy impact Haptics for App
  static Future<void> heavyImpact() {
    _debug('heavyImpact');
    return HapticFeedback.heavyImpact();
  }

  ///Selection Haptics for App
  static Future<void> selectionClick() {
    _debug('selectionClick');
    return HapticFeedback.selectionClick();
  }

  ///Vibrate Haptics for App
  static Future<void> vibrate() {
    _debug('vibrate');
    return HapticFeedback.vibrate();
  }

  static void _debug(String label) {
    if (debugLog) debugPrint('Haptic.$label');
    if (debugSound) {
      SystemSound.play(SystemSoundType.alert); // only plays on desktop
      SystemSound.play(SystemSoundType.click); // only plays on mobile
    }
  }
}
