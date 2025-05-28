// lib/pages/animated_positioned_directional_example.dart
import 'package:flutter/material.dart';
import 'position_helper.dart';
import 'positioned_controller.dart';

class AnimatedPositionedDirectionalExample extends StatefulWidget {
  const AnimatedPositionedDirectionalExample({super.key});

  @override
  State<AnimatedPositionedDirectionalExample> createState() =>
      _AnimatedPositionedDirectionalExampleState();
}

class _AnimatedPositionedDirectionalExampleState
    extends State<AnimatedPositionedDirectionalExample> {
  Offset _position = Offset.zero;
  static const double _step = 50.0;
  static const Size _boxSize = Size(100, 100);

  void _move(MoveDirection dir) {
    final media = MediaQuery.of(context).size;
    // 1) compute raw new pos
    final newPos = applyDirection(
      current: _position,
      direction: dir,
      step: _step,
    );
    // 2) clamp it
    final clampedX = clampHorizontal(
      value: newPos.dx,
      screenWidth: media.width,
      widgetWidth: _boxSize.width,
    );
    final clampedY = clampVertical(
      value: newPos.dy,
      screenHeight: media.height - kToolbarHeight, // subtract AppBar if needed
      widgetHeight: _boxSize.height + 16, // account for padding
    );
    setState(() {
      _position = Offset(clampedX, clampedY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Positioned Directional")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
              start: _position.dx,
              top: _position.dy,
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                width: _boxSize.width,
                height: _boxSize.height,
                child: Image.asset("assets/jerry.png"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: MoveDirection.values.map((dir) {
                  final icon = {
                    MoveDirection.left: Icons.arrow_left,
                    MoveDirection.right: Icons.arrow_right,
                    MoveDirection.up: Icons.arrow_upward,
                    MoveDirection.down: Icons.arrow_downward,
                  }[dir]!;
                  return ElevatedButton(
                    onPressed: () => _move(dir),
                    child: Icon(icon),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
