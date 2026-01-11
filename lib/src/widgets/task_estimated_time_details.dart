import 'package:flutter/material.dart';

class TaskEstimatedTimeDetails extends StatelessWidget {
  final int? estimatedMinutes;
  final VoidCallback onChanged;
  const TaskEstimatedTimeDetails({
    super.key,
    required this.estimatedMinutes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (estimatedMinutes == null || estimatedMinutes == 0) {
      return IconButton(onPressed: () {}, icon: Icon(Icons.schedule_outlined), );
    }else{
      return Container();
    }
  }
}
