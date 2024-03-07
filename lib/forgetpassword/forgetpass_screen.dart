import 'package:flutter/material.dart';
import 'package:reelrise/usefull.dart';

import '../otp/otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
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
      height: 10,
    );
    return Scaffold(
      backgroundColor: mainColor,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Forget PassWord?',
                  style: TextStyle(
                    fontSize: 25,
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            size,
            const Text(
              'You forgot your password? Don\'t worry, please  enter your recovery email address',
              style: style,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              style: style2, // Change input text color
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email Address';
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
                            builder: (context) => const OtpScreen()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
