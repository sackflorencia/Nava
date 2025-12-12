class Task {
  final int id;
  final int idStage;
  final String title;
  final int order;
  final String description;
  final int estimatedMinutes;
  final int difficulty;
  final bool isCompleted;
  Task({
    required this.id,
    required this.idStage,
    required this.title,
    this.estimatedMinutes = -1,
    required this.description,
    required this.order,
    this.difficulty = -1,
    this.isCompleted = false,
  });
}