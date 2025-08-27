import 'dart:async';

import 'package:flutter/material.dart';

class LogoutTimerProvider extends ChangeNotifier {
  Duration _remaining = const Duration(hours: 8);
  Timer? _timer;

  Duration get remaining => _remaining;

  void startCountdown(VoidCallback onLogout) {
    _remaining = const Duration(hours: 10);
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining.inSeconds > 0) {
        _remaining -= const Duration(seconds: 1);
        notifyListeners();
      } else {
        timer.cancel();
        onLogout(); // Auto logout
      }
    });
  }

  void stopCountdown() {
    _timer?.cancel();
  }
}
