// lib/pages/lottie_slider_example.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'slider_config.dart';
import 'slider_helper.dart';

class LottieSliderExample extends StatefulWidget {
  const LottieSliderExample({super.key});

  @override
  State<LottieSliderExample> createState() => _LottieSliderExampleState();
}

class _LottieSliderExampleState extends State<LottieSliderExample> {
  late final LottieSliderHelper _slider;

  @override
  void initState() {
    super.initState();
    _slider = LottieSliderHelper()..start();
  }

  @override
  void dispose() {
    _slider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lottie Slider Example")),
      body: PageView.builder(
        controller: _slider.controller,
        onPageChanged: (page) {
          setState(() {
            _slider.currentPage = page;
          });
        },
        itemCount: lottieAnimationPaths.length,
        itemBuilder: (_, i) => Center(
          child: Lottie.asset(
            lottieAnimationPaths[i],
            repeat: true,
            reverse: false,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _slider.currentPage,
        onTap: (page) {
          setState(() {});
          _slider.jumpTo(page);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.animation_outlined), label: "Animation 1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_medium), label: "Animation 2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental), label: "Animation 3")
        ],
      ),
    );
  }
}
