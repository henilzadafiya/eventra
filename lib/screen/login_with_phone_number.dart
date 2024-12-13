import 'package:eventra/constant.dart';
import 'package:eventra/screen/verify_code.dart';
import 'package:eventra/utils/utils.dart';
import 'package:eventra/widgets/round_button.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              key: _formKey,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: 'Phone number'),
              controller: phoneNumberController,
            ),
            SizedBox(
              height: 50,
            ),
            RoundButton(
              loading: loading,
              title: 'Send Otp',
              onTap: () {
                setState(() {
                  loading = true;
                });
                Constant.auth.verifyPhoneNumber(
                  phoneNumber: '+91${phoneNumberController.text}',
                  verificationCompleted: (phoneAuthCredential) {},
                  verificationFailed: (error) {
                    Utils().toastMessage(error.toString());
                    debugPrint(error.toString());
                    setState(() {
                      loading = false;
                    });
                  },
                  codeSent: (String verificationId, int? forceResendingToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyCode(
                            verificationId: verificationId,
                          ),
                        ));
                  },
                  codeAutoRetrievalTimeout: (verificationId) {
                    Utils().toastMessage(verificationId.toString());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
