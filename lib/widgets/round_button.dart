import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  RoundButton({super.key, required this.title, required this.onTap,this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Center(child: loading? CircularProgressIndicator(color: Colors.white,strokeWidth: 3,) :Text(title,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
