import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'themes.dart';
import 'dark_theme_provider.dart';
import 'package:provider/provider.dart';

class LoginSignupScreen extends StatefulWidget {
  

  const LoginSignupScreen({
    Key? key,
   
  }) : super(key: key);

  @override
  LoginSignupScreenState createState() => LoginSignupScreenState();
}

class LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isDarkMode = false; // Track the current mode

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
      // Notify parent widget of mode change
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
  final theme = themeProvider.isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
            child: Column(
              children: [
                const SizedBox(height: 60.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.56 - 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          themeProvider.isDarkMode 
                              ? 'assets/darkmodeloginman.jpg'
                              : 'assets/loginman.jpg',
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'Craft your ideal promotion with us!',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Streamline your campaign creation and elevate your product or service visibility',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  
                                ),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Text('Login'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Text('Register'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
          themeProvider.toggleDarkMode();
        },
                  child: Text(
                    themeProvider.isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
