import 'package:flutter/material.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/services/change_object_values.dart';

class StagesDropdown extends StatelessWidget {
  final List<Stage> stages;
  final Stage? selectedStage;
  final int taskId;
  const StagesDropdown({
    super.key,
    required this.stages,
    this.selectedStage,
    required this.taskId,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 190,
      initialSelection: selectedStage,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.onInverseSurface,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      trailingIcon: Icon(
        Icons.keyboard_arrow_down,
        color: Theme.of(context).colorScheme.onInverseSurface,
      ),
      selectedTrailingIcon: Icon(
        Icons.keyboard_arrow_up,
        color: Theme.of(context).colorScheme.onInverseSurface,
      ),
      dropdownMenuEntries: <DropdownMenuEntry<Stage>>[
        for (final stage in stages)
          DropdownMenuEntry<Stage>(
            value: stage,
            label: stage.title,
            labelWidget: Text(
              stage.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onInverseSurface,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
      onSelected: (stage) {
        if (stage == null) return;
        changeTaskStage(taskId, stage.id);
      },
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }
}
