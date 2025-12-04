import 'package:flutter/material.dart';
import 'package:nava/src/screens/account.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Account(),  
    );
  }
}