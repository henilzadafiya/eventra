import 'package:eventra/posts/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../utils/utils.dart';
import '../widgets/round_button.dart';

class VerifyCode extends StatefulWidget {
  final String verificationId;

  VerifyCode({required this.verificationId});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final verificaatonCodeController = TextEditingController();
  bool loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              decoration: InputDecoration(hintText: '6 didgit code'),
              controller: verificaatonCodeController,
            ),
            SizedBox(
              height: 50,
            ),
            RoundButton(
              loading: loading,
              title: 'Verify',
              onTap: () async {
                setState(() {
                  loading = true;
                });

                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verificaatonCodeController.text.toString());
                try {
                  await Constant.auth.signInWithCredential(credential);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen(),));
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(e.toString());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
