import 'package:nava/src/models/task.dart';

class Stage {
  final int id;
  final int idGoal;
  final String title;
  final int order;
  final String description;
  final List<Task> tasks;
  Stage({
    required this.id,
    required this.idGoal,
    required this.title,
    required this.description,
    required this.order,
    required this.tasks,
  });
}