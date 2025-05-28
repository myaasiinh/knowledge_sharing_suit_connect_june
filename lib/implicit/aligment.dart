import 'package:flutter/material.dart';

/// A simple list of all the Alignments you want to cycle through.
const List<Alignment> _alignmentCycle = [
  Alignment.topLeft,
  Alignment.topCenter,
  Alignment.topRight,
  Alignment.centerLeft,
  Alignment.center,
  Alignment.centerRight,
  Alignment.bottomLeft,
  Alignment.bottomCenter,
  Alignment.bottomRight,
];

/// Returns the next Alignment in the cycle based on [step].
/// 
/// Internally this does a modulo on the length of [_alignmentCycle],
/// so as you increment [step] beyond the last index it automatically wraps
/// back to the start.
Alignment getNextAlignment(int step) {
  final index = step % _alignmentCycle.length;
  return _alignmentCycle[index];
}
