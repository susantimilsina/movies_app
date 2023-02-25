import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// To check in which user is on
class PlatformInfo {
  static const _desktopPlatforms = [
    TargetPlatform.macOS,
    TargetPlatform.windows,
    TargetPlatform.linux
  ];
  static const _mobilePlatforms = [TargetPlatform.android, TargetPlatform.iOS];

  /// for checking if user is on desktop
  static bool get isDesktop =>
      _desktopPlatforms.contains(defaultTargetPlatform) && !kIsWeb;

  /// for checking if user is on desktop or web
  static bool get isDesktopOrWeb => isDesktop || kIsWeb;

  /// for checking if user is on mobile
  static bool get isMobile =>
      _mobilePlatforms.contains(defaultTargetPlatform) && !kIsWeb;

  /// for checking if user is on windows
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  /// for checking if user is on Linux
  static bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

  /// for checking if user is on MacOs
  static bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;

  /// for checking if user is on android
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// for checking if user is on iOS
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// to check wether app has connection to internet [isConnected]
  static Future<bool> get isConnected async =>
      // ignore: unnecessary_await_in_return
      await InternetConnectionChecker().hasConnection;

  /// to check wether app has connection to internet [isDisconnected]
  static Future<bool> get isDisconnected async => (await isConnected) == false;
}
