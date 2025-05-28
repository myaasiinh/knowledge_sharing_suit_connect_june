// lib/utils/custom_painter_animations.dart
import 'package:flutter/material.dart';

class CustomPainterAnimations {
  final AnimationController controller;
  late final Animation<double> size;
  late final Animation<Color?> color;

  CustomPainterAnimations({
    required TickerProvider vsync,
    Duration duration = 
    const Duration(seconds: 2),
  }) : controller = 
  AnimationController(
    vsync: vsync, 
    duration: duration) {
    size = Tween<double>(
      begin: 50, 
      end: 150)
      .animate(controller);
    color = ColorTween(
      begin: Colors.red, 
      end: Colors.blue)
        .animate(
          CurvedAnimation(
            parent: controller, 
            curve: Curves.easeIn));

    controller.repeat(reverse: true);
  }

  void dispose() => controller.dispose();
}
