import 'package:flutter/material.dart';

class TaskEstimatedTimeDetails extends StatelessWidget {
  final int? estimatedMinutes;
  final int taskid;
  final void Function(int minutes) onEstimatedTimeChanged;
  const TaskEstimatedTimeDetails({
    super.key,
    required this.estimatedMinutes,
    required this.taskid,
    required this.onEstimatedTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (estimatedMinutes == null || estimatedMinutes == 0) {
      return TextButton.icon(
        onPressed: () {
          _buildEstimatedTimeForm(context, taskid, estimatedMinutes);
        },
        label: const Text(
          'Agregar tiempo estimado',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        icon: Icon(Icons.schedule_outlined),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      );
    } else {
      return TextButton.icon(
        onPressed: () {
          _buildEstimatedTimeForm(context, taskid, estimatedMinutes);
        },
        label: Text(
          'Tiempo estimado: $estimatedMinutes min',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        icon: Icon(Icons.schedule_outlined),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      );
    }
  }

  void _buildEstimatedTimeForm(
    BuildContext context,
    int taskid,
    int? estimatedMinutes,
  ) {
    int initialIndex = ((estimatedMinutes ?? 5) / 5).round() - 1;
    final controller = FixedExtentScrollController(
      initialItem: initialIndex.clamp(0, 35),
    );
    int selectedMinutes = estimatedMinutes ?? 5;
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          alignment: Alignment.center,
          child: SizedBox(
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tiempo estimado',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 100,
                      child: ListWheelScrollView.useDelegate(
                        controller: controller,
                        onSelectedItemChanged: (index) {
                          selectedMinutes = (index + 1) * 5;
                        },
                        itemExtent: 50,
                        physics: FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                              child: Center(
                                child: Text(
                                  '${(index + 1) * 5}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onInverseSurface,
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: 36,
                        ),
                      ),
                    ),
                    Text(
                      'min',
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      onEstimatedTimeChanged(selectedMinutes);
    });
  }
}
