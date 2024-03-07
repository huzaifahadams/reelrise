import 'package:flutter/material.dart';
import 'package:reelrise/usefull.dart';

import '../restpasswordsuccefull/rest_pass_succeful.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    password2Controller.dispose();
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
                  'Reset Password',
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
                  'PLease Enter your new password to update\n the old one',
                  style: style,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
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
              controller: password2Controller,
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
                hintText: 'Confirm Password',
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPassSucceful()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Reset Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
