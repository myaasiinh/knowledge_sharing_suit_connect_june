import 'package:flutter/material.dart';
import 'explicit/inexed_stack_transition.dart';
import 'explicit/positioned_transition.dart';
import 'implicit/animated_align_example.dart';
import 'implicit/positional_direction.dart';
import 'low_level_custom/custom_paint.dart';
import 'page_transition/page_mix_fade_size_transition.dart';
import 'page_transition/page_size_transition.dart';
import 'page_transition/page_two.dart';
import 'third_party/lottie_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Knowledge Sharing 6 June"),
        ),
        body: Center(
            child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimatedAlignExample()));
                },
                child: const Text("Animated Align Example")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AnimatedPositionedDirectionalExample()));
                },
                child: const Text("Animated Positioned Directional Example")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PositionedTransitionExample()));
                },
                child: const Text("Positioned Transition Example")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const IndexedStackTransitionExample()));
                },
                child: const Text("Indexed Stack Transition Example")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.of(context)
                      .push(PageSizeTransition(const PageTwo()));
                },
                child: const Text(
                  "Page Size Transition",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.of(context)
                      .push(PageMixSizeFadeTransition(const PageTwo()));
                },
                child: const Text(
                  "Page Mix Size Fade Transition",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomPainterExample()));
                },
                child: const Text(
                  "Custom Painter Example",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LottieSliderExample()));
                },
                child: const Text(
                  "Lottie Slide Example",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        )));
  }
}
