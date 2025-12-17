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
  Task copyWith({
    int? id,
    int? idStage,
    String? title,
    int? order,
    String? description,
    int? estimatedMinutes,
    int? difficulty,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      idStage: id ?? this.idStage,
      title: title ?? this.title,
      order: order ?? this.order,
      description: description ?? this.description,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      difficulty: difficulty ?? this.difficulty,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
