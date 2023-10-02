import 'package:flutter/material.dart';
import 'dark_theme_provider.dart';
import 'themes.dart';
import 'package:provider/provider.dart';
import 'package:brandboost/login_signup_screens.dart';

class FallbackScreen extends StatelessWidget {
  const FallbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final theme = themeProvider.isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                themeProvider.isDarkMode
                    ? AppThemes.darkBackgroundImage
                    : AppThemes.lightBackgroundImage,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0), 
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Hang tight!',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'We\'re smoothing things out for you',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Image.asset(
                    'assets/hangtight.png',
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginSignupScreen(),
                        ),
                      );
                    },
                    child: const Text('Back to Login'),
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      themeProvider.toggleDarkMode();
                    },
                    child: Text(
                      themeProvider.isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

