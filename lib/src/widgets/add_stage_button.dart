import 'package:flutter/material.dart';

class AddStageTile extends StatelessWidget {
  final Function onPressed;
  final bool isEmpty;
  const AddStageTile({
    super.key,
    required this.onPressed,
    this.isEmpty = false,
  });
  @override
  Widget build(BuildContext context) {
    if (!isEmpty) {
      return SizedBox(
        width: 350,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            height: 75,
            width: 350,
            child: IconButton(
              onPressed: () => onPressed(),
              icon: Icon(Icons.add),
              style: IconButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Text(
                "Todavía no hay etapas",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {onPressed();},
                  icon: Icon(Icons.add),
                  iconSize: 90,
                  style: IconButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(
                "Creá la primera para empezar",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  }
}
