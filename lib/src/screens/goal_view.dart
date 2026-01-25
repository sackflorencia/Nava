import 'package:flutter/material.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/services/add_objects.dart';
import 'package:nava/src/services/change_object_values.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';
import 'package:nava/src/theme/theme_utils.dart';
import 'package:nava/src/utils/drag_scroll_manager.dart';
import 'package:nava/src/widgets/add_stage_button.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/stage_list_tile.dart';
import 'package:nava/src/widgets/task_recommendation_dialog.dart';

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
  final ScrollController _stageScrollController = ScrollController();
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    _goal = _goal;
    goalTitleController = TextEditingController(text: _goal.title);
    goalDescriptionController = TextEditingController(text: _goal.description);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_dialogShown) {
        _dialogShown = true;
        _showTaskRecommendationDialog();
      }
    });
    DragScrollManager.instance.attach(_stageScrollController);
  }

  @override
  void dispose() {
    goalTitleController.dispose();
    goalDescriptionController.dispose();
    _stageScrollController.dispose();
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
            SizedBox(
              height: 60,
              child: TextField(
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
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.73,
              child: ListView.builder(
                controller: _stageScrollController,
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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showTaskRecommendationDialog();
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                minimumSize: Size(250, 35),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                backgroundColor: lighten(
                  Theme.of(context).colorScheme.surfaceContainerHighest,
                  0.4,
                ),
              ),
              child: Text(
                "Recomendar tarea",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTaskRecommendationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return TaskRecommendationDialog(goalId: _goal.id);
      },
    );
  }
}
