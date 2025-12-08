import 'package:flutter/material.dart';
import 'package:nava/src/models/goal_template.dart';

class TemplateListTile extends StatelessWidget {
  final GoalTemplate template;
  const TemplateListTile({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          template.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          template.description,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(14),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            width: 2,
          ),
        ),
        //leading: Icon(IconData(template.iconName)),
        onTap: () {
          // TODO: Handle template selection
        },
      ),
    );
  }
}
