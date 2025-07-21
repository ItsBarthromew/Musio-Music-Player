import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF2A2A2A), // Main brand color
    onPrimary: Colors.white, // Text/icon on primary
    secondary: Color(0xFF5A5A5A), // Accent or secondary color
    onSecondary: Colors.white, // Text/icon on secondary
    error: Color(0xFFFF5100), // Error color
    onError: Colors.black, // Text/icon on error
    surface: Color(0xFF181818), // Background surfaces
    onSurface: Colors.white, // Text/icon on surface
  ),

  useMaterial3: true, // Use Material 3 design
);
