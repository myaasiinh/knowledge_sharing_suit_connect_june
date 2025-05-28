import 'package:flutter/material.dart';

class PageMixSizeFadeTransition extends PageRouteBuilder {
  /// The page you’re pushing.
  final Widget page;

  /// How long the forward & reverse transition should take.
  final Duration duration;

  PageMixSizeFadeTransition(
    this.page, {
    this.duration = const Duration(milliseconds: 1000),  // ← slower default
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          
          // ← apply custom durations
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
          },
        );
}
