import 'package:flutter/material.dart';
import 'package:nava/src/models/stage.dart';

class StageListTile extends StatelessWidget{
  final Stage stage;
  const StageListTile({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'hola'
      )
    );
  }
}