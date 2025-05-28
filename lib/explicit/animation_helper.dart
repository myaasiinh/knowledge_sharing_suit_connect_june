// lib/utils/animation_helper.dart
import 'package:flutter/material.dart';

import 'positioned_tween_config.dart';

/// Holds all three PositionedTransition animations using a single controller.
class PositionedAnimations {
  /// Shared controller driving all tweens.
  final AnimationController controller;

  /// Animations for each character, all driven by [controller].
  late final Animation<RelativeRect> jerry;
  late final Animation<RelativeRect> tom;
  late final Animation<RelativeRect> spike;

  /// Factory that creates a controller and wires up all tweens.
  PositionedAnimations({
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 300),
  }) : controller = AnimationController(
    vsync: vsync, duration: duration) {
    jerry = RelativeRectTween(
      begin: jerryConfig.begin,
      end: jerryConfig.end,
    ).animate(controller);

    tom = RelativeRectTween(
      begin: tomConfig.begin,
      end: tomConfig.end,
    ).animate(controller);

    spike = RelativeRectTween(
      begin: spikeConfig.begin,
      end: spikeConfig.end,
    ).animate(controller);
  }

  /// Starts the animation from the beginning.
  void forward() {
    controller
      ..reset()
      ..forward();
  }

  /// Reverses the animation.
  void reverse() => controller.reverse();

  /// Dispose the controller when done.
  void dispose() => controller.dispose();
}
