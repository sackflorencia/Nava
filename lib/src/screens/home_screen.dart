import 'package:flutter/material.dart';
import 'package:nava/src/models/goals.dart';
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
            if(goals.isEmpty)
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
            Expanded(
              child: GridView.builder(
                itemCount: goals.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(14),
                        ),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          width: 2,
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withValues(alpha: 0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              goals[index].goal,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Ánimo! Quedan ${goals[index].tasksLeftInStage} tareas para finalizar la etapa "${goals[index].currentStage}"',
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Goals> goals = [
  Goals(
    goal: 'Aprender inglés',
    tasksLeftInStage: 5,
    currentStage: 'Gramática básica',
  ),
  Goals(
    goal: 'Aprender a tocar la trompeta',
    tasksLeftInStage: 3,
    currentStage: 'Notas iniciales',
  ),
  Goals(
    goal: 'Hacer una escultura',
    tasksLeftInStage: 4,
    currentStage: 'Boceto en arcilla',
  ),
  Goals(
    goal: 'Aprender C#',
    tasksLeftInStage: 6,
    currentStage: 'Sintaxis fundamental',
  ),
  Goals(
    goal: 'Aprender a armar un cubo Rubik',
    tasksLeftInStage: 2,
    currentStage: 'Método principiante',
  ),
  Goals(
    goal: 'Aprender a cocinar sushi',
    tasksLeftInStage: 3,
    currentStage: 'Preparación del arroz',
  ),
  Goals(
    goal: 'Aprender fotografía',
    tasksLeftInStage: 5,
    currentStage: 'Manejo de cámara',
  ),
  Goals(
    goal: 'Aprender a dibujar retratos',
    tasksLeftInStage: 4,
    currentStage: 'Proporciones faciales',
  ),
  Goals(
    goal: 'Tocar una canción en piano',
    tasksLeftInStage: 2,
    currentStage: 'Práctica de acordes',
  ),
  Goals(
    goal: 'Aprender a editar videos',
    tasksLeftInStage: 3,
    currentStage: 'Timeline básico',
  ),
];
