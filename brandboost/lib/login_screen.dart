import 'package:brandboost/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:brandboost/login_signup_screens.dart';
import 'package:brandboost/campaign_screen.dart';
import 'package:brandboost/fallback_screen.dart';
import 'package:brandboost/register_screen.dart';
import 'package:provider/provider.dart';
import 'dark_theme_provider.dart';
import 'themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final UserService userService = UserService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      themeProvider.isDarkMode
                          ? AppThemes.darkBackgroundImage
                          : AppThemes.lightBackgroundImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 60.0),
                      const Text(
                        'Hey!',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Welcome back, you\'ve been missed!',
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40.0),
                      TextField(
                        controller: _emailController,
                        textAlign: TextAlign.left,
                        decoration: _buildInputDecoration(hintText: 'Email'),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: _buildInputDecoration(hintText: 'Password'),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () async {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please enter both email and password')));
                            return;
                          }

                          bool isValid = await userService.validateUser(
                              _emailController.text, _passwordController.text);
                          if (isValid) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CampaignScreen(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Invalid credentials')));
                          }
                        },
                        child: const Center(
                          child: Text('Sign In'),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton.icon(
                        icon: Image.asset('assets/google_logo.png',
                            height: 24.0, width: 24.0),
                        label: const Text('Continue with Google'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          backgroundColor:  Color.fromARGB(255, 255, 255, 255) ,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 100.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FallbackScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'Register now',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RegisterScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            themeProvider.toggleDarkMode();
                          });
                        },
                        child: Text(
                          themeProvider.isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 30.0,
            left: 20.0,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary ,
              radius: 20.0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.grey),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginSignupScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration({required String hintText}) {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.primary ,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
