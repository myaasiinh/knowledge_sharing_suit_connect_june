// lib/utils/lottie_slider_helper.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'slider_config.dart';

/// Manages a [PageController] that auto‐advances through
/// [lottieAnimationPaths] every [interval], looping back to 0.
class LottieSliderHelper {
  final PageController controller;
  final Duration interval;
  Timer? _timer;

  int currentPage = 0;
  int get pageCount => 
  lottieAnimationPaths.length;

  LottieSliderHelper({
    this.interval = const Duration(seconds: 3),
  }) : controller = PageController();

  /// Start the auto‐advance loop.
  void start() {
    _timer = Timer.periodic(interval, (_) {
      final next = 
      (currentPage + 1) % pageCount;
      controller.animateToPage(
        next,
        duration: const Duration
        (milliseconds: 500),
        curve: Curves.linear,
      );
      currentPage = next;
    });
  }

  /// Stop auto‐advance and dispose the [PageController].
  void dispose() {
    _timer?.cancel();
    controller.dispose();
  }

  /// Manually jump to [page], cancelling any pending timer tick.
  void jumpTo(int page) {
    _timer?.cancel();
    controller.animateToPage(
      page,
      duration: const Duration(
        milliseconds: 500),
      curve: Curves.linear,
    );
    currentPage = page;
    start();
  }
}
