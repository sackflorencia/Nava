import 'dart:async';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:nava/src/theme/theme_utils.dart';

void showConfettiOverlay(BuildContext context) {
  final overlay = Overlay.of(context);

  late final OverlayEntry entry;

  final confettiController = ConfettiController(
    duration: const Duration(milliseconds: 4200),
  );

  entry = OverlayEntry(
    builder: (context) {
      return Positioned.fill(
        child: IgnorePointer(
          child: Container(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.1,
              numberOfParticles: 20,
              gravity: 0.3,
              canvas: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.surfaceContainerHighest,
                lighten(Theme.of(context).colorScheme.primary,),
                lighten(Theme.of(context).colorScheme.secondary,),
                lighten(Theme.of(context).colorScheme.surfaceContainerHighest,),
                darken(Theme.of(context).colorScheme.primary,),
                darken(Theme.of(context).colorScheme.secondary,),
                darken(Theme.of(context).colorScheme.surfaceContainerHighest,),
              ],
            ),
          ),
        ),
      );
    },
  );

  overlay.insert(entry);

  confettiController.play();

  Timer(const Duration(milliseconds: 8000), () {
    confettiController.dispose();
    entry.remove();
  });
}
