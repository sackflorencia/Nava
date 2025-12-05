import 'package:flutter/material.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_outlined_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "¡Bienvenido a Nava!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(44, 44, 44, 1),
              ),
            ),
            SizedBox(height:15),
            const Text(
              "Navegá tus objetivos",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(107, 107, 107, 1),
              ),
            ),
            SizedBox(height:40),
            PersonalizedOutlinedButton(
              text: 'Log in',
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Esta función todavía no está disponible",
                );
              },
            ),
            SizedBox(height:40),
            PersonalizedElevatedButton(
              color: Color.fromRGBO(255, 216, 94, 1),
              text: 'Sign up',
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Esta función todavía no está disponible",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
