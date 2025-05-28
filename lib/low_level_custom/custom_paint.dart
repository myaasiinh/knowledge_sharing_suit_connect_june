import 'package:flutter/material.dart';
import 'circle_painter.dart';
import 'custom_paint_animator.dart';

class CustomPainterExample extends StatefulWidget {
  const CustomPainterExample({super.key});

  @override
  State<CustomPainterExample> createState() => _CustomPainterExampleState();
}

class _CustomPainterExampleState extends State<CustomPainterExample>
    with SingleTickerProviderStateMixin {
  late final CustomPainterAnimations _anim;

  @override
  void initState() {
    super.initState();
    _anim = CustomPainterAnimations(vsync: this);
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Painter Example")),
      body: Center(
        child: AnimatedBuilder(
          animation: _anim.controller,
          builder: (_, __) => CustomPaint(
            painter: CirclePainter(
              _anim.size.value,
              _anim.color.value ?? Colors.red,
            ),
            size: const Size.square(200),
          ),
        ),
      ),
    );
  }
}
