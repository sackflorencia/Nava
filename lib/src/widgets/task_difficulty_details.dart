import 'package:flutter/material.dart';

class TaskDifficultyDetails extends StatefulWidget {
  final int taskId;
  final int? difficulty;
  final void Function(int level) onDifficultyChanged;
  const TaskDifficultyDetails({
    super.key,
    required this.taskId,
    required this.difficulty,
    required this.onDifficultyChanged,
  });

  @override
  State<TaskDifficultyDetails> createState() => _TaskDifficultyDetailsState();
}

class _TaskDifficultyDetailsState extends State<TaskDifficultyDetails> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    late String difficultyLevel;
    switch (widget.difficulty) {
      case 1:
        difficultyLevel = "Fácil";
        break;
      case 2:
        difficultyLevel = "Media";
        break;
      case 3:
        difficultyLevel = "Difícil";
        break;
    }
    String buttonLabel() {
      if (widget.difficulty == null || widget.difficulty == 0) {
        return _isSelected ? 'Dificultad' : 'Agregar dificultad';
      }
      if (_isSelected) {
        return 'Dificultad';
      }
      return 'Dificultad: $difficultyLevel';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () {
            setState(() {
              _isSelected = true;
            });
          },
          label: Text(
            buttonLabel(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          icon: Icon(Icons.whatshot),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        ),
        if (_isSelected)
          _buildDifficultySelection(
            context,
            widget.taskId,
            widget.onDifficultyChanged,
            widget.difficulty,
          ),
      ],
    );
  }

  Widget _buildDifficultySelection(
    BuildContext context,
    int taskId,
    void Function(int level) onDifficultyChanged,
    int? selectedDifficulty,
  ) {
    return Row(
      children: [
        Expanded(
          child: ChoiceChip(
            label: Text(
              'Fácil',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            selected: selectedDifficulty == 1,
            onSelected: (selected) {
              if (selected) {
                onDifficultyChanged(1);
                setState(() {
                  _isSelected = false;
                });
              }
            },
          ),
        ),
        Expanded(
          child: ChoiceChip(
            label: Text(
              'Media',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            selected: selectedDifficulty == 2,
            onSelected: (selected) {
              if (selected) {
                onDifficultyChanged(2);
                setState(() {
                  _isSelected = false;
                });
              }
            },
          ),
        ),
        Expanded(
          child: ChoiceChip(
            label: Text(
              'Difícil',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            selected: selectedDifficulty == 3,
            onSelected: (selected) {
              if (selected) {
                onDifficultyChanged(3);
                setState(() {
                  _isSelected = false;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
