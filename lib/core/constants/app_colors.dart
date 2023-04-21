import 'package:flutter/material.dart';

class AppColors {
  // Prevent from being instantiated and extended
  const AppColors._();

  static const lightBackgroundColor = Color(0xFFF2F2F2);
  static const lightPrimaryColor = Color(0xFFF2F2F2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static const lightParticlesColor = Color(0x44948282);

  static const darkBackgroundColor = Color(0xFF1A2127);
  static const darkPrimaryColor = Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static const darkParticlesColor = Color(0x441C2A3D);
}

extension ColorIntensity on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
