// lib/pages/positioned_transition_example.dart
import 'package:flutter/material.dart';
import 'animation_helper.dart';

class PositionedTransitionExample extends StatefulWidget {
  const PositionedTransitionExample({super.key});

  @override
  State<PositionedTransitionExample> createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample>
    with SingleTickerProviderStateMixin {
  late final PositionedAnimations _animations;

  @override
  void initState() {
    super.initState();
    _animations = PositionedAnimations(vsync: this);
  }

  @override
  void dispose() {
    _animations.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Positioned Transition Example")),
      body: Stack(
        children: [
          PositionedTransition(
            rect: _animations.spike,
            child: _buildImageBox("assets/dog.png", Colors.blueGrey),
          ),
          PositionedTransition(
            rect: _animations.tom,
            child: _buildImageBox("assets/tom.png", Colors.grey),
          ),
          PositionedTransition(
            rect: _animations.jerry,
            child: _buildImageBox("assets/jerry.png", Colors.orange),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _animations.forward,
                    child: const Icon(Icons.play_arrow),
                  ),
                  ElevatedButton(
                    onPressed: _animations.reverse,
                    child: const Icon(Icons.replay),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageBox(String asset, Color bg) {
    return Container(
      width: 100,
      height: 100,
      color: bg,
      child: Image.asset(asset),
    );
  }
}
