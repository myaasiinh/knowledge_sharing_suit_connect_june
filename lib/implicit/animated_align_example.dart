import 'package:flutter/material.dart';
import 'aligment.dart'; 

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Align Example")),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: getNextAlignment(_step),
            duration: const Duration(milliseconds: 400),
            child: Image.asset('assets/jerry.png', width: 100, height: 100),
          ),
          AnimatedAlign(
            alignment: getNextAlignment(_step + 1),
            duration: const Duration(milliseconds: 400),
            child: Image.asset('assets/tom.png', width: 100, height: 100),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: () => setState(() => _step++),
      ),
    );
  }
}
