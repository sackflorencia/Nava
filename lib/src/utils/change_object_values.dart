import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/utils/current_goals.dart';
import 'package:nava/src/utils/get_objects_and_lists.dart';

void changeTaskTitleAndDescription(
  int taskID,
  String title,
  String description,
) {
  final task = getTaskById(taskID);
  if (task == null) {
    return;
  }
  final updatedTask = Task(
    id: task.id,
    title: title,
    description: description,
    idStage: task.idStage,
    order: task.order,
    estimatedMinutes: task.estimatedMinutes,
    difficulty: task.difficulty,
    isCompleted: task.isCompleted,
  );
  final index = currentTasks.indexWhere((task) => task.id == taskID);
  if (index == -1) {
    return;
  }
  currentTasks[index] = updatedTask;
}

void changeGoalTitleAndDescription(
  int goalId,
  String title,
  String description,
) {
  final goal = getGoalById(goalId);
  if (goal == null) return;
  final updatedGoal = Goal(id: goal.id, title: title, description: description);
  final index = currentGoals.indexWhere((goal) => goal.id == goalId);
  if (index == -1) {
    return;
  }
  currentGoals[index] = updatedGoal;
}

void changeStageTitle(int stageId, String title) {
  final stage = getStageById(stageId);
  if (stage == null) return;
  final updatedStage = Stage(
    id: stage.id,
    idGoal: stage.idGoal,
    title: title,
    order: stage.order,
  );
  final index = currentStages.indexWhere((stage) => stage.id == stageId);
  if (index == -1) {
    return;
  }
  currentStages[index] = updatedStage;
}

void changeIsCompletedTaskValue(int taskId, bool? isCompleted) {
  if (isCompleted == null) return;
  final task = getTaskById(taskId);
  if (task == null) return;
  final updatedTask = Task(
    id: task.id,
    title: task.title,
    description: task.description,
    idStage: task.idStage,
    order: task.order,
    estimatedMinutes: task.estimatedMinutes,
    difficulty: task.difficulty,
    isCompleted: isCompleted,
  );
  final index = currentTasks.indexWhere((task) => task.id == taskId);
  if (index == -1) {
    return;
  }
  currentTasks[index] = updatedTask;
}

void changeTasksOrder(int taskId, int newOrder) {
  Task? task = getTaskById(taskId);
  if (task == null) return;
  int lastOrder = task.order;
  if (lastOrder == newOrder) return;
  int stageId = task.idStage;
  List<Task> tasks = getTasksByStageId(stageId);
  if (newOrder > lastOrder) {
    for (Task task in tasks) {
      if (task.order > lastOrder && task.order <= newOrder) {
        final updatedTask = Task(
          id: task.id,
          title: task.title,
          description: task.description,
          idStage: task.idStage,
          order: task.order - 1,
          estimatedMinutes: task.estimatedMinutes,
          difficulty: task.difficulty,
          isCompleted: task.isCompleted,
        );
        final index = currentTasks.indexWhere((task2) => task2.id == task.id);
        if (index == -1) {
          return;
        }
        currentTasks[index] = updatedTask;
      }
    }
  } else {
    for (Task task in tasks) {
      if (task.order >= newOrder && task.order < lastOrder) {
        final updatedTask = Task(
          id: task.id,
          title: task.title,
          description: task.description,
          idStage: task.idStage,
          order: task.order + 1,
          estimatedMinutes: task.estimatedMinutes,
          difficulty: task.difficulty,
          isCompleted: task.isCompleted,
        );
        final index = currentTasks.indexWhere((task2) => task2.id == task.id);
        if (index == -1) {
          return;
        }
        currentTasks[index] = updatedTask;
      }
    }
  }
  final updatedTask = Task(
    id: task.id,
    title: task.title,
    description: task.description,
    idStage: task.idStage,
    order: newOrder,
    estimatedMinutes: task.estimatedMinutes,
    difficulty: task.difficulty,
    isCompleted: task.isCompleted,
  );
  final index = currentTasks.indexWhere((task) => task.id == taskId);
  if (index == -1) {
    return;
  }
  currentTasks[index] = updatedTask;
}
