import 'package:flutter/material.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/widgets/grid_goal_preview.dart';
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(14),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Agregar nuevo objetivo",
                        style: TextStyle(
                          fontSize: 23,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        size: 30,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (goals.isEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Parece que no tienes objetivos aún. ¡Agrega uno nuevo para comenzar tu viaje de aprendizaje!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            GridGoalPreview(goals: goals),
          ],
        ),
      ),
    );
  }
}

List<Goal> goals = [
  Goal(
    goal: 'Aprender inglés',
    tasksLeftInStage: 5,
    currentStage: 'Gramática básica',
  ),
  Goal(
    goal: 'Aprender a tocar la trompeta',
    tasksLeftInStage: 3,
    currentStage: 'Notas iniciales',
  ),
  Goal(
    goal: 'Hacer una escultura',
    tasksLeftInStage: 4,
    currentStage: 'Boceto en arcilla',
  ),
  Goal(
    goal: 'Aprender C#',
    tasksLeftInStage: 6,
    currentStage: 'Sintaxis fundamental',
  ),
  Goal(
    goal: 'Aprender a armar un cubo Rubik',
    tasksLeftInStage: 2,
    currentStage: 'Método principiante',
  ),
  Goal(
    goal: 'Aprender a cocinar sushi',
    tasksLeftInStage: 3,
    currentStage: 'Preparación del arroz',
  ),
  Goal(
    goal: 'Aprender fotografía',
    tasksLeftInStage: 5,
    currentStage: 'Manejo de cámara',
  ),
  Goal(
    goal: 'Aprender a dibujar retratos',
    tasksLeftInStage: 4,
    currentStage: 'Proporciones faciales',
  ),
  Goal(
    goal: 'Tocar una canción en piano',
    tasksLeftInStage: 2,
    currentStage: 'Práctica de acordes',
  ),
  Goal(
    goal: 'Aprender a editar videos',
    tasksLeftInStage: 3,
    currentStage: 'Timeline básico',
  ),
];
