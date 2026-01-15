import 'package:nava/src/models/stage.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/get_tasks_left_in_stage.dart';
import 'dart:math';

Task? taskRecommendation(int goalId, int energy) {
  Stage? currentStage = getCurrentStage(goalId);
  if (currentStage == null) {
    return null;
  }
  List<Task> tasks = getTasksLeftInStage(currentStage.id);
  if(tasks.isEmpty){
    return null;
  }
  int availableEnergy = obtainAvailableEnergy(energy);
  List<Task> tasksWithCost = [];
  List<double> costs = [];
  List<Task> tasksWithoutCost = [];
  for (Task task in tasks) {
    double cost = energyCost(task);
    if (cost != -1) {
      tasksWithCost.add(task);
      costs.add(cost);
    } else {
      tasksWithoutCost.add(task);
    }
  }
  if(tasksWithCost.isEmpty){
    final random = Random();
    int randomIndex = random.nextInt(tasksWithoutCost.length);
    return tasksWithoutCost[randomIndex];
  }
  Task? bestTask;
  double bestDifference = double.infinity;

  for (int i = 0; i < tasksWithCost.length; i++) {
    double difference = costs[i] - availableEnergy;
    double distance = difference.abs();
    if (distance < bestDifference) {
      bestDifference = distance;
      bestTask = tasksWithCost[i];
    }
    else if(distance == bestDifference && difference <= 0){
      bestTask = tasksWithCost[i];
    }
  }
  return bestTask ?? tasksWithCost.first;
}
double energyCost(Task task){
  if(task.difficulty == null && task.estimatedMinutes == null){
    return -1;
  }
  double timeCost;
  if(task.estimatedMinutes != null){
    timeCost = (task.estimatedMinutes! / 180) * 3;
  }else{
    timeCost = 1;
  }
  double difficultyCost;
  if(task.difficulty != null){
    difficultyCost = task.difficulty!.toDouble() * 2;
  }else{
    difficultyCost = 1;
  }
  return timeCost + difficultyCost;
}

int obtainAvailableEnergy(int energy){
  if(energy == 1){
    return 3;
  }else if(energy == 2){
    return 5;
  }else if (energy == 3){
    return 8;
  }else{
    return -1;
  }
}