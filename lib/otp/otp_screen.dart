import 'package:flutter/material.dart';
import 'package:reelrise/usefull.dart';

import '../resetpassword/reset_pass.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<TextEditingController> otpControllers =
      List.generate(5, (_) => TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpControllers.forEach((controller) => controller.dispose());
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
              children: const [
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 25,
                    color: textColor2,
                  ),
                ),
              ],
            ),
            size,
            Row(
              children: const [
                Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                    text: '5 digits code has been sent to  ',
                    style: style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'huxxx@gmail.com ',
                        style: TextStyle(
                          color: textColor2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            size,
            size,
            size,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: textColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: style2,
                    controller: otpControllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counter: Offstage(),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 4) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
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
                            builder: (context) => const ResetPassScreen()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Verify'),
              ),
            ),
            size,
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassScreen()),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Didn\'t  Receive OTP ? ',
                  style: style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Resend ',
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
