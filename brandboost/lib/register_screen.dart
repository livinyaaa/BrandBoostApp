import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'dark_theme_provider.dart';
import 'package:brandboost/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

@override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  themeProvider.isDarkMode
                      ? 'assets/darkmodebg.jpg'
                      : 'assets/lightmodebg.jpg',
                ),
                fit: BoxFit.cover, 
              ),
            ),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildRegisterContent(),
                  ),
                ),
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
      fillColor: Theme.of(context).colorScheme.primary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 49, 1, 57), width: 2.0),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

  List<Widget> _buildRegisterContent() {
    return [
      const SizedBox(height: 15.0),
      const Text(
        'Hey!',
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 5.0),
      const Text(
        'We\'re excited to have you join us!',
        style: TextStyle(fontSize: 18.0, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _usernameController,
        decoration: _buildInputDecoration(hintText: 'Choose a username'),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _businessNameController,
        decoration:
            _buildInputDecoration(hintText: 'Enter your business name'),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _businessTypeController,
        decoration: _buildInputDecoration(
          hintText: 'Enter your business type or industry',
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _emailController,
        decoration: _buildInputDecoration(hintText: 'Email'),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: _buildInputDecoration(hintText: 'Choose a password'),
      ),
      const SizedBox(height: 30.0),
      ElevatedButton(
        onPressed: () async {
          // Handle registration logic here
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Text('Register'),
      ),
      const SizedBox(height: 10.0),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Have an account already? ',
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
              text: 'Sign In',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to the login screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
      const SizedBox(height: 10.0),
      TextButton(
        onPressed: () {
          // Toggle dark mode
          final themeProvider =
              Provider.of<DarkThemeProvider>(context, listen: false);
          themeProvider.toggleDarkMode();
        },
        child: Consumer<DarkThemeProvider>(
          builder: (context, themeProvider, child) {
            return Text(
              themeProvider.isDarkMode
                  ? 'Switch to light mode'
                  : 'Switch to dark mode',
              style: const TextStyle(color: Colors.blue),
            );
          },
        ),
      ),
    ];
  }
}

