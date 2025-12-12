import 'package:nava/src/models/goal_template.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/utils/current_goals.dart';

class Goal {
  final int id;
  final String title;
  final String description;
  final List<Stage> stages;
  Goal({
    required this.id,
    required this.title,
    required this.description,
    required this.stages,
  });
}

void addGoal({GoalTemplate? goal, required String name}) {
    Goal lastGoal = currentGoals[currentGoals.length - 1];
    int lastGoalId = lastGoal.id;
    int lastStageId = -1;
    int lastTaskId = -1;
    if (lastGoal.stages != []) {
      Stage lastStage = lastGoal.stages[lastGoal.stages.length - 1];
      lastStageId = lastStage.id;
      Task lastTask = lastStage.tasks[lastStage.tasks.length - 1];
      lastTaskId = lastTask.id;
    }
    if (goal == null) {
      currentGoals.add(
        Goal(id: (lastGoalId + 1), title: name, description: "", stages: []),
      );
    } else {
      int goalId = lastGoalId + 1;
      int stageId = lastStageId + 1;
      int taskId = lastTaskId + 1;
      currentGoals.add(
        Goal(
          id: goalId,
          title: name,
          description: goal.description,
          stages: [
            for (StageTemplate stage in goal.stages)
              Stage(
                id: stageId++,
                idGoal: goalId,
                title: stage.title,
                description: stage.description,
                order: stage.order,
                tasks: [
                  for (TaskTemplate task in stage.tasks)
                    Task(
                      id: taskId++,
                      idStage: (stageId - 1),
                      title: task.title,
                      estimatedMinutes: task.estimatedMinutes,
                      description: task.description,
                      order: task.order,
                      difficulty: task.difficulty,
                    ),
                ],
              ),
          ],
        ),
      );
    }
  }
