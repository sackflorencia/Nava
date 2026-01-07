import 'package:flutter/material.dart';
import 'package:nava/src/models/stage.dart';

class StagesDropdown extends StatelessWidget {
  final List<Stage> stages;
  final Stage? selectedStage;
  final VoidCallback onSelected;
  const StagesDropdown({
    super.key,
    required this.stages,
    this.selectedStage,
    required this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 200,
      initialSelection: selectedStage,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.onInverseSurface,
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
              ),
            ),
          ),
      ],
      onSelected: (stage) {
        onSelected();
      },
    );
  }
}
