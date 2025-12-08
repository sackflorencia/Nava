import 'package:flutter/material.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/navbar.dart';

class ChooseGoalTemplate extends StatelessWidget{
  final String goalTitle;
  const ChooseGoalTemplate({super.key, required this.goalTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavaAppBar(),
      drawer: Navbar(),
      body: Center(
        child: Column(
          children: [
            Text('Elegir plantilla para "$goalTitle"'),
            Text('Aquí se mostrarán las plantillas disponibles para el objetivo "$goalTitle".'),
          ],
        ),
      ),
    );
  }
}