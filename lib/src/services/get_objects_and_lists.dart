import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/current_goals.dart';

List<Stage> getStagesByGoalId(int goalId) {
  List<Stage> stages = [];
  for (Stage stage in currentStages) {
    if (stage.idGoal == goalId) {
      stages.add(stage);
    }
  }
  stages.sort((a, b) => a.order.compareTo(b.order));
  return stages;
}

List<Task> getTasksByStageId(int stageId) {
  List<Task> tasks = [];
  for (Task task in currentTasks) {
    if (task.idStage == stageId) {
      tasks.add(task);
    }
  }
  tasks.sort((a, b) => a.order.compareTo(b.order));
  return tasks;
}

Goal? getGoalById(int goalId) {
  try {
    Goal foundGoal = currentGoals.firstWhere((goal) => goal.id == goalId);
    return foundGoal;
  } on StateError {
    return null;
  }
}
Stage? getStageById(int stageId){
  try {
    Stage foundStage = currentStages.firstWhere((stage) => stage.id == stageId);
    return foundStage;
  } on StateError {
    return null;
  }
}
Task? getTaskById(int taskId){
  try {
    Task foundTask = currentTasks.firstWhere((task) => task.id == taskId);
    return foundTask;
  } on StateError {
    return null;
  }
}
List<Stage> getStagesByTaskId(int taskId){
  Task? task = getTaskById(taskId);
  if(task == null){
    return [];
  }
  Stage? stage = getStageById(task.idStage);
  if(stage == null){
    return [];
  }
  return getStagesByGoalId(stage.idGoal);
}