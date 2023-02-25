import 'dart:async';

import 'package:flutter/material.dart';

/// Debouncer class
class Debouncer {
  /// Instance of [Debouncer]
  Debouncer(this.interval);

  /// interval to debounce the code or function
  final Duration interval;

  VoidCallback? _action;
  Timer? _timer;

  /// used to call debouncer
  void call(VoidCallback action) {
    // Let the latest action override whatever was there before
    _action = action;
    // Always cancel and restart the timer
    _timer?.cancel();
    _timer = Timer(interval, _callAction);
  }

  void _callAction() {
    _action?.call(); // If we have an action queued up, complete it.
    _timer = null;
  }

  /// reseting the debouncer
  void reset() {
    _action = null;
    _timer = null;
  }
}
