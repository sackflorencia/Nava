import 'package:flutter/material.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/services/add_objects.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';
import 'package:nava/src/widgets/tasks_list.dart';

class StageListTile extends StatefulWidget {
  final Stage stage;
  const StageListTile({super.key, required this.stage});

  @override
  State<StageListTile> createState() => _StageListTileState();
}

class _StageListTileState extends State<StageListTile> {
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
          Text(
            widget.stage.title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TasksList(
              tasks: getTasksByStageId(widget.stage.id),
              onChanged: () {
                _refresh();
              },
            ),
          ),
          SizedBox(height: 10),
          IconButton(
            onPressed: () {
              addTask(widget.stage.id);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
