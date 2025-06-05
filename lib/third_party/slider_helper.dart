// File: lib/utils/lottie_slider_helper.dart

// Mengimpor paket Dart async untuk menggunakan Timer.
import 'dart:async';
// Mengimpor paket Flutter dasar yang berisi widget, layout, dan utilitas.
import 'package:flutter/material.dart';
// Mengimpor konfigurasi slider yang berisi daftar path animasi Lottie.
import 'slider_config.dart';

/// Mengelola [PageController] yang secara otomatis berpindah melalui
/// daftar [lottieAnimationPaths] setiap [interval], dan akan kembali ke halaman 0.
class LottieSliderHelper {
  /// Controller untuk mengatur PageView.
  final PageController controller;
  /// Interval waktu antar perpindahan otomatis halaman.
  final Duration interval;
  /// Timer yang memicu perpindahan halaman setiap [interval].
  Timer? _timer;

  /// Halaman saat ini (indeks) yang sedang ditampilkan.
  int currentPage = 0;
  /// Jumlah total halaman berdasarkan panjang daftar [lottieAnimationPaths].
  int get pageCount => lottieAnimationPaths.length;

  /// Konstruktor LottieSliderHelper, menerima parameter opsional [interval].
  /// Jika tidak diberikan, interval default adalah 3 detik.
  LottieSliderHelper({
    this.interval = const Duration(seconds: 3),
  }) : controller = PageController(); // Inisialisasi PageController baru.

  /// Memulai loop auto‐advance: setiap [interval], pindah ke halaman berikutnya.
  void start() {
    _timer = Timer.periodic(interval, (_) {
      // Hitung indeks halaman berikutnya dengan modulo agar kembali ke 0 jika mencapai akhir.
      final next = (currentPage + 1) % pageCount;
      // Animasikan perpindahan ke halaman berikutnya dengan durasi 500ms dan kurva linear.
      controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      // Perbarui nilai currentPage setelah animasi dimulai.
      currentPage = next;
    });
  }

  /// Menghentikan auto‐advance dan me‐dispose [PageController].
  void dispose() {
    // Batalkan timer jika masih aktif.
    _timer?.cancel();
    // Dispose PageController untuk melepaskan sumber daya.
    controller.dispose();
  }

  /// Melompat secara manual ke halaman [page], membatalkan timer yang sedang berjalan.
  void jumpTo(int page) {
    // Batalkan timer agar tidak terjadi perpindahan otomatis mendadak.
    _timer?.cancel();
    // Animasikan perpindahan langsung ke halaman yang dipilih dengan durasi 500ms dan kurva linear.
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    // Perbarui nilai currentPage menjadi halaman yang dituju.
    currentPage = page;
    // Mulai ulang auto‐advance setelah perpindahan manual.
    start();
  }
}
