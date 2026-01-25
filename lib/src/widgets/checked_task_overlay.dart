import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:nava/src/theme/theme_utils.dart';
import 'package:nava/src/widgets/circle_icon_button.dart';
import 'package:nava/src/widgets/task_preview.dart';

void showTaskCompletedOverlay(BuildContext context, int taskId) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  final confettiController = ConfettiController(
    duration: const Duration(milliseconds: 1200),
  );

  entry = OverlayEntry(
    builder: (context) {
      return Positioned.fill(
        child: Material(
          color: Colors.black.withAlpha(150),
          child: Stack(
            children: [
              IgnorePointer(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    emissionFrequency: 0.1,
                    numberOfParticles: 20,
                    gravity: 0.3,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                      lighten(Theme.of(context).colorScheme.primary),
                      darken(Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '¡Felicitaciones!',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Has completado esta tarea.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TaskPreview(taskId: taskId, isLinked: false,),

                  ],
                ),
              ),

              Positioned(
                top: 24,
                right: 24,
                child: Row(
                  children: [
                    CircleIconButton(
                      icon: Icons.celebration,
                      onPressed: () {
                        confettiController
                          ..stop()
                          ..play();
                      },
                    ),
                    const SizedBox(width: 20),

                    CircleIconButton(
                      icon: Icons.close,
                      onPressed: () {
                        confettiController.dispose();
                        entry.remove();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );

  overlay.insert(entry);
  confettiController.play();
}
