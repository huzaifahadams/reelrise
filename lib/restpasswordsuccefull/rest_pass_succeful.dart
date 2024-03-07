import 'package:flutter/material.dart';
import 'package:reelrise/login/login_screen.dart';
import 'package:reelrise/usefull.dart';

class ResetPassSucceful extends StatefulWidget {
  const ResetPassSucceful({Key? key}) : super(key: key);

  @override
  State<ResetPassSucceful> createState() => _ResetPassSuccefulState();
}

class _ResetPassSuccefulState extends State<ResetPassSucceful> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            Row(
              children: const [
                Text(
                  'Congrats!',
                  style: TextStyle(
                    fontSize: 30,
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            size,
            Row(
              children: const [
                Text(
                  'Congrats your password has been updated please \ncontinue to login',
                  style: style,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
