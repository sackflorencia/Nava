import 'package:flutter/material.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/services/change_object_values.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';
import 'package:nava/src/widgets/modify_title_and_description_pop_up.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/navbar.dart';
import 'package:nava/src/widgets/personalized_outlined_button.dart';
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
    goalTitleController = TextEditingController();
    goalDescriptionController = TextEditingController();
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
      drawer: Navbar(),
      body: Center(
        child: Column(
          children: [
            Text(
              _goal.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onInverseSurface,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              _goal.description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onInverseSurface,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8,),
            PersonalizedOutlinedButton(
              text: 'Editar',
              onPressed: () {
                goalDescriptionController.text = _goal.description;
                goalTitleController.text = _goal.title;
                showDialog(
                  context: context,
                  builder: (context) {
                    return ModifyTitleAndDescriptionPopUp(
                      descriptionController: goalDescriptionController,
                      onConfirm: () {
                        setState(() {
                          changeGoalTitleAndDescription(
                            _goal.id,
                            goalTitleController.text,
                            goalDescriptionController.text,
                          );
                          _goal = _goal.copyWith(
                            title: goalTitleController.text,
                            description: goalDescriptionController.text,
                          );
                        });
                        Navigator.of(context).pop();
                      },
                      titleController: goalTitleController,
                    );
                  },
                );
              },
              foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stages.length,
                itemBuilder: (context, index) {
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
