import 'package:eventra/constant.dart';
import 'package:eventra/screen/login_screen.dart';
import 'package:eventra/utils/utils.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Screen"),actions: [
        IconButton(onPressed: () {
          Constant.auth.signOut().then((value) {
            Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => LoginScreen(),));
          },).onError((error, stackTrace) {
            Utils().toastMessage(error.toString());
          },);

        }, icon: Icon(Icons.logout_outlined))
      ],),
    );
  }
}
