// File: lib/utils/indexed_stack_transition_helper.dart

// Mengimpor paket Flutter yang berisi widget, animasi, dan utilitas Material Design.
import 'package:flutter/material.dart';

/// Kelas yang memaketkan sebuah AnimationController untuk menggerakkan
/// tween opacity (fade) dan scale, sekaligus menangani logika pergantian
/// anak di dalam IndexedStack.
class IndexedStackTransitionHelper {
  /// Controller animasi utama yang menggerakkan semua tween.
  final AnimationController controller;

  /// Tween untuk mengatur tingkat opasitas (fade in).
  late final Animation<double> opacity;

  /// Tween untuk mengatur skala (zoom in).
  late final Animation<double> scale;

  /// Indeks saat ini di dalam IndexedStack.
  int currentIndex = 0;

  /// Jumlah maksimum indeks (jumlah children) di dalam IndexedStack.
  final int maxIndex;

  /// Konstruktor yang menerima:
  /// - [vsync]: TickerProvider dari State agar animasi berjalan efisien.
  /// - [maxIndex]: Jumlah total anak di IndexedStack (default 3).
  /// - [duration]: Durasi animasi (default 1 detik).
  IndexedStackTransitionHelper({
    required TickerProvider vsync,
    this.maxIndex = 3,
    Duration duration = const Duration(seconds: 1),
  }) : controller = AnimationController(
          vsync: vsync,      // Memberikan vsync agar animasi disinkronkan
          duration: duration, // Menetapkan durasi animasi
        ) {
    // Membuat Tween opacity dari 0.0 (transparan) ke 1.0 (penuh),
    // kemudian menghubungkannya ke controller.
    opacity = Tween<double>(begin: 0.0, end: 1.0)
        .animate(controller);

    // Membuat Tween scale dari 0.1 (10% ukuran asli) ke 1.0 (100% ukuran),
    // kemudian menghubungkannya ke controller.
    scale = Tween<double>(begin: 0.1, end: 1.0)
        .animate(controller);

    // Langsung menjalankan animasi (dari 0.0 → 1.0) pada saat konstruktor selesai.
    controller.forward();
  }

  /// Metode untuk berpindah ke indeks berikutnya di dalam IndexedStack.
  /// Jika mencapai indeks terakhir, maka akan kembali ke 0 (wrap-around).
  /// Setelah update indeks, controller di-reset dan diputar lagi (replay animasi).
  void goToNext() {
    // Hitung indeks selanjutnya dengan modulo agar kembali ke 0 jika melebihi maxIndex - 1.
    currentIndex = (currentIndex + 1) % maxIndex;
    controller
      ..reset()   // Kembalikan animasi ke awal (0.0)
      ..forward(); // Jalankan ulang animasi (0.0 → 1.0)
  }

  /// Membersihkan (dispose) AnimationController ketika sudah tidak dipakai lagi
  /// untuk menghindari kebocoran memori.
  void dispose() => controller.dispose();
}
