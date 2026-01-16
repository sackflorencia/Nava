import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/task_recomendation.dart';

class TaskRecommendationDialog extends StatelessWidget {
  final int goalId;
  const TaskRecommendationDialog({super.key, required this.goalId});

  @override
  Widget build(BuildContext context) {
    late Task? recommendedTask;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "¿Cuánta energía tenés hoy?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            RatingBar(
              ratingWidget: RatingWidget(
                full: Icon(Icons.battery_full, color: Colors.green),
                half: Icon(Icons.battery_3_bar, color: Colors.orange),
                empty: Icon(Icons.battery_1_bar, color: Colors.grey),
              ),
              onRatingUpdate: (rate) {
                recommendedTask = taskRecommendation(goalId, rate);
              },
              itemCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}
