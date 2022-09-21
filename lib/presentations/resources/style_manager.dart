import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/font_manager.dart';

ThemeData ApplicationTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: FontManager.f36,fontWeight: FontWeight.w700,letterSpacing: -0.8),
      titleMedium: TextStyle(fontSize: FontManager.f24, fontWeight: FontWeight.w700, letterSpacing: -0.8),
      bodySmall: TextStyle(fontSize: FontManager.f14),
      bodyMedium: TextStyle(fontSize: FontManager.f16),

    ),
  );
}
