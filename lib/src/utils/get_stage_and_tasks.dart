import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/utils/current_goals.dart';

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

List<Task> getTasksByStageId(int stageId){
  List<Task> tasks = [];
  for (Task task in currentTasks) {
    if (task.idStage == stageId) {
      tasks.add(task);
    }
  }
  tasks.sort((a, b) => a.order.compareTo(b.order));
  return tasks;
}