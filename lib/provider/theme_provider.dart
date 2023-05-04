import 'package:flutter_riverpod/flutter_riverpod.dart';

class themeNotifier extends StateNotifier<bool> {
  themeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final themeProvider = StateNotifierProvider<themeNotifier, bool>(
  (ref) => themeNotifier(),
);