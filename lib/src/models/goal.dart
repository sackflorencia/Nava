import 'package:nava/src/models/goal_template.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/utils/current_goals.dart';

class Goal {
  final int id;
  final String title;
  final String description;
  Goal({required this.id, required this.title, required this.description});
}

void addGoal({GoalTemplate? goal, required String name}) {
  Goal lastGoal = currentGoals[currentGoals.length - 1];
  int goalId = lastGoal.id + 1;
  Stage lastStage = currentStages[currentStages.length - 1];
  int stageId = lastStage.id + 1;
  Task lastTask = currentTasks[currentTasks.length - 1];
  int taskId = lastTask.id + 1;
  if (goal == null) {
    currentGoals.add(Goal(id: (goalId), title: name, description: ""));
  } else {
    currentGoals.add(
      Goal(id: goalId, title: name, description: goal.description),
    );
    for (StageTemplate stage in goal.stages) {
      currentStages.add(
        Stage(
          id: stageId++,
          idGoal: goalId,
          title: stage.title,
          order: stage.order,
        ),
      );
      for (TaskTemplate task in stage.tasks) {
        currentTasks.add(
          Task(
            id: taskId++,
            idStage: stageId - 1,
            title: task.title,
            description: task.description,
            order: task.order,
          ),
        );
      }
    }
  }
}
