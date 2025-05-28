import 'package:flutter/material.dart';

class PageSizeTransition extends PageRouteBuilder {
  /// The page you’re navigating to.
  final Widget page;

  /// How long the animation should take.
  final Duration duration;

  PageSizeTransition(
    this.page, {
    this.duration = const Duration(milliseconds: 1000), // ← slower default
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          
          // ← set both forward & reverse durations
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
        );
}
