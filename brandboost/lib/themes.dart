import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 247, 203, 233),
        secondary: Color.fromARGB(255, 35, 93, 89)),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(145, 79, 79, 79),
      ),
      displayMedium: TextStyle( // Define bodyText1 for subtext in light mode
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
  
    colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 45, 51, 122),
        secondary: Color.fromARGB(255, 35, 93, 89)),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      displayMedium: TextStyle( // Define bodyText1 for subtext in dark mode
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey, // Grey text color for dark mode
        backgroundColor: Colors.white, // White background color for dark mode
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
  );

  static String lightBackgroundImage = 'assets/lightmodebg.jpg';
  static String darkBackgroundImage = 'assets/darkmodebg.jpg';
}


