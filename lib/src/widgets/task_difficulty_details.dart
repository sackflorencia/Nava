import 'package:flutter/material.dart';

class TaskDifficultyDetails extends StatelessWidget{
  final int taskId;
  final int? difficulty;
  final void Function(int level) onDifficultyChanged;
  const TaskDifficultyDetails({super.key, required this.taskId, required this.difficulty, required this.onDifficultyChanged});

  @override
  Widget build(BuildContext context) {
    late String difficultyLevel;
    switch(difficulty){
      case 1:
        difficultyLevel = "Fácil";
        break;
      case 2:
        difficultyLevel = "Medio";
        break;
      case 3:
        difficultyLevel = "Difícil";
        break;
    }
    if(difficulty == null || difficulty == 0){
      return TextButton.icon(
        onPressed: (){
          
        },
        label: const Text('Agregar dificultad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        icon: Icon(Icons.whatshot),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      );
    } else {
      return TextButton.icon(
        onPressed: (){
          
        },
        label: Text('Dificultad: $difficultyLevel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        icon: Icon(Icons.whatshot),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      );
    }
  }
}