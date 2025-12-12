import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';

List<Goal> currentGoals = [
  Goal(
    id: 1,
    title: 'Aprender a meditar',
    description: 'Crear una práctica de meditación simple y sostenible.',
  ),
];
List<Stage> currentStages = [
  Stage(id: 1, idGoal: 1, title: 'Introducción', order: 1),
  Stage(id: 2, idGoal: 1, title: 'Práctica básica', order: 2),
  Stage(id: 2, idGoal: 1, title: 'Crear rutina', order: 3),
];

List<Task> currentTasks = [
  Task(
    id: 1,
    idStage: 1,
    title: 'Leer guía corta',
    description: 'Leer una explicación breve sobre qué es meditar.',
    order: 1,
    estimatedMinutes: 10,
    difficulty: 1,
  ),
  Task(
    id: 2,
    idStage: 1,
    title: 'Respiración consciente',
    description: 'Practicar 3 minutos de respiración enfocada.',
    order: 2,
    estimatedMinutes: 3,
    difficulty: 1,
  ),
  Task(
    id: 3,
    idStage: 2,
    title: 'Escaneo corporal',
    description: 'Recorrer el cuerpo con atención plena.',
    order: 1,
    estimatedMinutes: 5,
    difficulty: 1,
  ),
  Task(
    id: 4,
    idStage: 3,
    title: 'Definir horario',
    description: 'Elegir un momento del día para meditar.',
    order: 1,
    estimatedMinutes: 5,
    difficulty: 1,
  ),
];
