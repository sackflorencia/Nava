import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Bienvenido a Nava!",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}