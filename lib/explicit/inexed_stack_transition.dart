// lib/pages/indexed_stack_transition_example.dart
import 'package:flutter/material.dart';
import 'inexed_stack_helper.dart';

class IndexedStackTransitionExample extends StatefulWidget {
  const IndexedStackTransitionExample({super.key});

  @override
  State<IndexedStackTransitionExample> createState() =>
      _IndexedStackTransitionExampleState();
}

class _IndexedStackTransitionExampleState
    extends State<IndexedStackTransitionExample>
    with SingleTickerProviderStateMixin {
late final IndexedStackTransitionHelper _animator;

  @override
  void initState() {
    super.initState();
    _animator = IndexedStackTransitionHelper(vsync: this);
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IndexedStack Transition")),
      body: IndexedStack(
        index: _animator.currentIndex,
        children: [
          _buildChild(Colors.red,   "assets/jerry.png"),
          _buildChild(Colors.blue,  "assets/dog.png"),
          _buildChild(Colors.green, "assets/tom.png"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(_animator.goToNext);
        },
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }

  Widget _buildChild(Color bg, String asset) {
    return ScaleTransition(
      scale: _animator.scale,
      child: FadeTransition(
        opacity: _animator.opacity,
        child: Container(
          color: bg,
          alignment: Alignment.center,
          child: Image.asset(asset),
        ),
      ),
    );
  }
}
