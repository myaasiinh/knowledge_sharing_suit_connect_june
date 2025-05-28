// lib/utils/direction_helper.dart
import 'package:flutter/material.dart';

/// The four cardinal move directions.
enum MoveDirection { left, right, up, down }

/// Applies [direction] to the current (start, top) position by [step] px,
/// returning the new un‐clamped Offset.
Offset applyDirection({
  required Offset current,
  required MoveDirection direction,
  required double step,
}) {
  switch (direction) {
    case MoveDirection.left:
      return Offset(current.dx - step, current.dy);
    case MoveDirection.right:
      return Offset(current.dx + step, current.dy);
    case MoveDirection.up:
      return Offset(current.dx, current.dy - step);
    case MoveDirection.down:
      return Offset(current.dx, current.dy + step);
  }
}
