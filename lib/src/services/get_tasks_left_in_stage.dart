import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';

Stage? getCurrentStage(int goalId){
  final goal = getGoalById(goalId);
  if(goal ==  null) return null;
  List<Stage> stages = getStagesByGoalId(goalId);
  bool isStageFinished = true;
  int i = 0;
  Stage? currentStage;
  while(isStageFinished && i<stages.length){
    List<Task> tasks = getTasksByStageId(stages[i].id);
    int j = 0;
    while(isStageFinished && j<tasks.length){
      if(!tasks[j].isCompleted){
        isStageFinished = false;
      }
      j++;
    }
    if(!isStageFinished){
      currentStage = stages[i];
    }
    i++;
  }
  return currentStage;
}

List<Task> getTasksLeftInStage(int stageId){
  final stage = getStageById(stageId);
  if(stage == null) return [];
  List<Task> tasks = getTasksByStageId(stage.id);
  List<Task> tasksLeft = [];
  for(Task task in tasks){
    if(!task.isCompleted){
      tasksLeft.add(task);
    }
  }
  return tasksLeft;
}

int getTaskLeftInCurrentStage(int goalId){
  final currentStage = getCurrentStage(goalId);
  if(currentStage == null) return -1;
  int tasksLeft = 0;
  List<Task> tasks = getTasksByStageId(currentStage.id);
  for(Task task in tasks){
    if(!task.isCompleted){
      tasksLeft++;
    }
  }
  return tasksLeft;
}