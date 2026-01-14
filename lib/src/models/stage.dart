class Stage {
  final int id;
  final int idGoal;
  final String title;
  final int order;
  Stage({
    required this.id,
    required this.idGoal,
    required this.title,
    required this.order,
  });
  Stage copyWith({
    int? id,
    int? idGoal,
    String? title,
    int? order,
  }) {
    return Stage(
      id: id ?? this.id,
      idGoal: idGoal ?? this.idGoal,
      title: title ?? this.title,
      order: order ?? this.order,
    );
  }
}