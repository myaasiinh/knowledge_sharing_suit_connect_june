// lib/utils/positioned_tween_configs.dart
import 'package:flutter/material.dart';

class TweenConfig {
  final RelativeRect begin;
  final RelativeRect end;
  const TweenConfig(this.begin, this.end);
}

/// Jerry moves from (0,0) → (300,300)
const jerryConfig = TweenConfig(
  RelativeRect.fromLTRB(0, 0, 0, 0),
  RelativeRect.fromLTRB(300, 300, 0, 0),
);

/// Tom moves from (0,0) → (150,150)
const tomConfig = TweenConfig(
  RelativeRect.fromLTRB(0, 0, 0, 0),
  RelativeRect.fromLTRB(150, 150, 0, 0),
);

/// Spike moves from (0,0) → (50,50)
const spikeConfig = TweenConfig(
  RelativeRect.fromLTRB(0, 0, 0, 0),
  RelativeRect.fromLTRB(50, 50, 0, 0),
);
