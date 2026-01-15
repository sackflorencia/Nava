import 'package:flutter/material.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/services/add_objects.dart';
import 'package:nava/src/services/change_object_values.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';
import 'package:nava/src/widgets/add_stage_button.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/stage_list_tile.dart';

class GoalView extends StatefulWidget {
  final Goal goal;
  const GoalView({super.key, required this.goal});

  @override
  State<GoalView> createState() => _GoalViewState();
}

class _GoalViewState extends State<GoalView> {
  late Goal _goal = widget.goal;
  late final TextEditingController goalTitleController;
  late final TextEditingController goalDescriptionController;

  @override
  void initState() {
    super.initState();
    _goal = _goal;
    goalTitleController = TextEditingController(text: _goal.title);
    goalDescriptionController = TextEditingController(text: _goal.description);
  }

  @override
  void dispose() {
    goalTitleController.dispose();
    goalDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late List<Stage> stages = getStagesByGoalId(_goal.id);
    return Scaffold(
      appBar: NavaAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
              child: TextField(
                textInputAction: TextInputAction.done,
                controller: goalTitleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
                onChanged: (title) {
                  changeGoalValues(_goal.id, title: title);
                  setState(() {
                    _goal = _goal.copyWith(title: title);
                  });
                },
              ),
            ),
            SizedBox(height: 5),
            TextField(
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              controller: goalDescriptionController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onInverseSurface,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(border: InputBorder.none),
              onChanged: (description) {
                changeGoalValues(_goal.id, description: description);
                setState(() {
                  _goal = _goal.copyWith(description: description);
                });
              },
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stages.length + 1,
                itemBuilder: (context, index) {
                  if (index == stages.length) {
                    return AddStageTile(
                      onPressed: () {
                        addStage(widget.goal.id);
                        setState(() {});
                      },
                      isEmpty: stages.isEmpty,
                    );
                  }
                  Stage stage = stages[index];
                  return StageListTile(stage: stage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
