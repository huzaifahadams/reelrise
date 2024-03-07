import 'package:flutter/material.dart';
import 'package:reelrise/login/login_screen.dart';
import 'package:reelrise/usefull.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: textColor,
    );
    const style2 = TextStyle(
      color: textColor2,
    );
    const size = SizedBox(
      height: 30,
    );
    return Scaffold(
      backgroundColor: mainColor,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  color: textColor2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              style: style2, // Change input text color

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Your Names ';
                }
                return null;
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Full Name',
                hintStyle: style,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                ),
              ),
            ),
            size,
            TextFormField(
              style: style2, // Change input text color

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Your Emaill Address ';
                }
                return null;
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email Address',
                hintStyle: style,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                ),
              ),
            ),
            size,
            TextFormField(
              style: style2, // Change input text color

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              obscureText: _obscurePassword,
              enableSuggestions: false,
              autocorrect: false,
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: style,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: textColor,
                  ),
                ),
              ),
            ),
            size,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
            ),
            const Text(
              'Or',
              style: style,
            ),
            size,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Implement Google Sign-In
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/download.png',
                      width: 40,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                GestureDetector(
                  onTap: () {
                    // Implement Facebook Sign-In
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/google.png', // Replace with your Facebook icon asset
                      width: 40,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            size,
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Do you already have an account? ',
                  style: style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login ',
                      style: TextStyle(
                        color: textColor2,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
