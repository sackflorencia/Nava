import 'package:flutter/material.dart';
import 'package:nava/src/widgets/elevated_button.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              "¡Bienvenido a Nava!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(44, 44, 44, 1),
              ),
            ),
            Text(
              "Navegá tus objetivos",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(107, 107, 107, 1),
              ),
            ),
            Text("Sign in"),
            PersonalizedElevatedButton(color: Color.fromRGBO(255, 216, 94,1), text: 'Sign up'),
          ],
        ),
      ),
    );
  }
}
