// File: lib/utils/custom_painter_animations.dart

// Mengimpor paket Flutter dasar untuk widget, animasi, dan warna.
import 'package:flutter/material.dart';

// Mendefinisikan kelas CustomPainterAnimations yang berfungsi untuk mengatur
// animasi kombinasi perubahan ukuran dan warna menggunakan AnimationController.
class CustomPainterAnimations {
  // Controller animasi utama yang mengatur waktu animasi.
  final AnimationController controller;

  // Animasi untuk ukuran (double) yang akan dihasilkan dari Tween.
  late final Animation<double> size;

  // Animasi untuk warna (Color?) yang akan dihasilkan dari ColorTween.
  late final Animation<Color?> color;

  // Konstruktor utama, membutuhkan vsync (TickerProvider) dan durasi opsional.
  CustomPainterAnimations({
    required TickerProvider vsync,             // vsync untuk sinkronisasi frame animasi
    Duration duration =                       // Durasi default animasi (2 detik)
        const Duration(seconds: 2),
  }) : controller =                            // Inisialisasi AnimationController
        AnimationController(
          vsync: vsync,                       // Menyediakan Ticker untuk animasi
          duration: duration,                 // Durasi animasi masuk (forward) dan keluar (reverse)
        ) {
    // Mendefinisikan Tween untuk animasi ukuran :
    // dari nilai 50 (begin) hingga 150 (end).
    size = Tween<double>(
      begin: 50,                              // Ukuran awal
      end: 150,                               // Ukuran akhir
    ).animate(controller);                    // Menghubungkan Tween ke controller

    // Mendefinisikan ColorTween untuk animasi warna :
    // dari Colors.red (begin) hingga Colors.blue (end).
    // Animasi warna ini menggunakan kurva easeIn untuk transisi lebih halus.
    color = ColorTween(
      begin: Colors.red,                     // Warna awal
      end: Colors.blue,                      // Warna akhir
    ).animate(
      CurvedAnimation(
        parent: controller,                  // Menggunakan controller sebagai parent
        curve: Curves.easeIn,               // Kurva animasi (easeIn)
      ),
    );

    // Memulai animasi berulang-ulang (repeat) bolak-balik (reverse: true).
    // Artinya, setelah mencapai akhir animasi, akan kembali ke nilai awal, lalu ulang lagi.
    controller.repeat(reverse: true);
  }

  // Metode untuk membersihkan (dispose) controller saat tidak lagi digunakan,
  // agar memori dan sumber daya dilepas dengan benar.
  void dispose() => controller.dispose();
}
