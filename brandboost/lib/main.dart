import 'package:flutter/material.dart';
import 'login_signup_screens.dart';
import 'login_screen.dart';
import 'themes.dart'; 
import 'dark_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DarkThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<DarkThemeProvider>(context);
    return MaterialApp(
      title: 'BrandBoost',
      theme: themeProvider.isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
      
      home: LoginSignupScreen(
        
      ),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}




