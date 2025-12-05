import 'package:flutter/material.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_outlined_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¡Bienvenido a Nava!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height:15),
            Text(
              "Navegá tus objetivos",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
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
              color: Theme.of(context).colorScheme.secondary,
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
