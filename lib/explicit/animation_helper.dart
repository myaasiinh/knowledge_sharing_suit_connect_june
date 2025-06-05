// File: lib/utils/animation_helper.dart

// Mengimpor paket Flutter yang berisi widget, animasi, dan utilitas Material Design.
import 'package:flutter/material.dart';

// Mengimpor konfigurasi tween untuk setiap karakter (Jerry, Tom, Spike),
// yang berisi nilai begin dan end untuk RelativeRectTween.
import 'positioned_tween_config.dart';

/// Kelas yang memegang ketiga animasi PositionedTransition (Jerry, Tom, Spike)
/// menggunakan satu AnimationController yang sama.
class PositionedAnimations {
  /// Controller animasi yang digunakan bersama oleh semua tween.
  final AnimationController controller;

  /// Animasi untuk karakter Jerry, digerakkan oleh [controller].
  late final Animation<RelativeRect> jerry;
  /// Animasi untuk karakter Tom, digerakkan oleh [controller].
  late final Animation<RelativeRect> tom;
  /// Animasi untuk karakter Spike, digerakkan oleh [controller].
  late final Animation<RelativeRect> spike;

  /// Factory constructor yang membuat AnimationController dan menghubungkan semua tween.
  PositionedAnimations({
    required TickerProvider vsync,                         // Vsync untuk sinkronisasi frame animasi
    Duration duration = const Duration(milliseconds: 300), // Durasi default animasi 300ms
  }) : controller = AnimationController(
          vsync: vsync,       // Menyediakan Ticker untuk animasi
          duration: duration, // Menetapkan durasi animasi
        ) {
    // Menyiapkan tween untuk animasi Jerry menggunakan konfigurasi yang didefinisikan
    // di positioned_tween_config.dart (jerryConfig.begin dan jerryConfig.end).
    jerry = RelativeRectTween(
      begin: jerryConfig.begin, // Posisi awal Jerry (RelativeRect)
      end: jerryConfig.end,     // Posisi akhir Jerry (RelativeRect)
    ).animate(controller);       // Menghubungkan tween ke controller

    // Menyiapkan tween untuk animasi Tom menggunakan konfigurasi tomConfig.
    tom = RelativeRectTween(
      begin: tomConfig.begin, // Posisi awal Tom
      end: tomConfig.end,     // Posisi akhir Tom
    ).animate(controller);     // Menghubungkan tween ke controller

    // Menyiapkan tween untuk animasi Spike menggunakan konfigurasi spikeConfig.
    spike = RelativeRectTween(
      begin: spikeConfig.begin, // Posisi awal Spike
      end: spikeConfig.end,     // Posisi akhir Spike
    ).animate(controller);      // Menghubungkan tween ke controller
  }

  /// Memulai animasi dari awal.
  void forward() {
    controller
      ..reset()   // Mengatur kembali controller ke status awal (0.0)
      ..forward(); // Menjalankan animasi maju (0.0 → 1.0)
  }

  /// Membalikkan animasi (1.0 → 0.0).
  void reverse() => controller.reverse();

  /// Membersihkan (dispose) controller ketika tidak dibutuhkan lagi,
  /// untuk mencegah kebocoran memori.
  void dispose() => controller.dispose();
}
