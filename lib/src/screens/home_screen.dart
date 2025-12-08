import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/widgets/grid_goal_preview.dart';
import 'package:nava/src/widgets/little_textfield.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/navbar.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_text_button.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController goalController;

  @override
  void initState() {
    super.initState();
    goalController = TextEditingController();
  }

  @override
  void dispose() {
    goalController.dispose();
    super.dispose();
  }

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
                  onPressed: () => openDialog(),
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

  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Agregar objetivo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LittleTextField(
            hintText: 'Ingrese el nombre del objetivo',
            controller: goalController,
          ),
          SizedBox(height: 20),
          PersonalizedElevatedButton(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            text: 'Agregar desde una plantilla',
            onPressed: () => _handleChoosingTemplate(goalController, context)
          ),
          SizedBox(height: 10),
          PersonalizedTextButton(
            text: 'O crear el objetivo vacío',
            onPressed: () {},
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancelar',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}

void _handleChoosingTemplate(TextEditingController goalController, context) {
  if (goalController.text.isEmpty) {
    Fluttertoast.showToast(msg: "Por favor ingrese el nombre de su objetivo");
  } else {
    GoRouter.of(
      context,
    ).go('/choose_goal_template', extra: goalController.text);
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
