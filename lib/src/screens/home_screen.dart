import 'package:flutter/material.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavaAppBar(),
      drawer: Navbar(),
      body: Center(
        child: Text(
          "Hola, $email",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
