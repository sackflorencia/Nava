import 'package:flutter/material.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/services/add_objects.dart';
import 'package:nava/src/services/change_object_values.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';
import 'package:nava/src/widgets/modify_title_and_description_pop_up.dart';
import 'package:nava/src/widgets/tasks_list.dart';

class StageListTile extends StatefulWidget {
  final Stage stage;
  const StageListTile({super.key, required this.stage});

  @override
  State<StageListTile> createState() => _StageListTileState();
}

class _StageListTileState extends State<StageListTile> {
  late final TextEditingController newTaskTitleController;
  late final TextEditingController newTaskDescriptionController;
  late final TextEditingController stageTitleController;
  late Stage _stage;

  @override
  void initState() {
    super.initState();
    _stage = widget.stage;
    newTaskTitleController = TextEditingController();
    newTaskDescriptionController = TextEditingController();
    stageTitleController = TextEditingController(text: _stage.title);
  }

  @override
  void dispose() {
    newTaskTitleController.dispose();
    newTaskDescriptionController.dispose();
    stageTitleController.dispose();
    super.dispose();
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          TextField(
            controller: stageTitleController,
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onChanged: (value) {
              changeStageTitle(_stage.id, value);
              setState(() {
                _stage = _stage.copyWith(title: value);
              });
            },
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Expanded(
            child: TasksList(
              tasks: getTasksByStageId(_stage.id),
              onChanged: () {
                _refresh();
              },
            ),
          ),
          SizedBox(height: 10),
          // IconButton(
          //   onPressed: () {
          //     int taskId = addTask(_stage.id);
          //     showDialog(
          //       context: context,
          //       builder: (context) {
          //         return ModifyTitleAndDescriptionPopUp(
          //           titleController: newTaskTitleController,
          //           descriptionController: newTaskDescriptionController,
          //           onConfirm: () {
          //             changeTaskValues(
          //               taskId,
          //               title: newTaskTitleController.text,
          //               description: newTaskDescriptionController.text,
          //             );
          //             _refresh();
          //             Navigator.of(context).pop();
          //           },
          //         );
          //       },
          //     );
          //   },
          //   icon: Icon(Icons.add),
          // ),
        ],
      ),
    );
  }
}
