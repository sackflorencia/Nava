import 'package:flutter/material.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/navbar.dart';

class GoalView extends StatelessWidget {
  final Goal goal;
  const GoalView({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavaAppBar(),
      drawer: Navbar(),
      body: Center(
        child: Column(
          children: [
            Text(
              goal.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 20,
              ),
            ),
            Text(
              goal.description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 14,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
