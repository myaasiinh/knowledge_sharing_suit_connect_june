// lib/utils/indexed_stack_transition_helper.dart
import 'package:flutter/material.dart';

/// Encapsulates a single AnimationController driving both a fade
/// and a scale tween, plus logic to cycle through an IndexedStack.
class IndexedStackTransitionHelper {
  final AnimationController controller;
  late final Animation<double> opacity;
  late final Animation<double> scale;
  int currentIndex = 0;
  final int maxIndex;

  /// [vsync] from your State; [maxIndex] defaults to 3 children.
  IndexedStackTransitionHelper({
    required TickerProvider vsync,
    this.maxIndex = 3,
    Duration duration = const Duration(seconds: 1),
  }) : controller = AnimationController(
    vsync: vsync, 
    duration: duration) {
    opacity = Tween<double>(begin: 0.0, end: 1.0)
    .animate(controller);
    scale   = Tween<double>(begin: 0.1, end: 1.0)
    .animate(controller);
    controller.forward();
  }

  /// Advance to the next index (wrapping back to 0), and replay.
  void goToNext() {
    currentIndex = (currentIndex + 1) % maxIndex;
    controller
      ..reset()
      ..forward();
  }

  /// Dispose when you’re done.
  void dispose() => controller.dispose();
}
