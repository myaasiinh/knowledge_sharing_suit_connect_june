// Mengimpor paket dasar Flutter untuk membangun antarmuka pengguna berbasis Material Design.
import 'package:flutter/material.dart';

// Mendefinisikan kelas PageSizeTransition yang memperluas PageRouteBuilder.
// Kelas ini digunakan untuk membuat rute halaman dengan animasi perubahan ukuran (SizeTransition).
class PageSizeTransition extends PageRouteBuilder {
  /// Widget halaman yang akan dinavigasikan (ditampilkan).
  final Widget page;

  /// Durasi animasi saat transisi masuk (push) dan keluar (pop).
  final Duration duration;

  // Konstruktor utama untuk kelas ini.
  // - `this.page` menginisialisasi halaman yang akan ditampilkan.
  // - `this.duration` mengatur durasi animasi, dengan default 1000ms (1 detik).
  PageSizeTransition(
    this.page, {
    this.duration = const Duration(milliseconds: 1000), // ← durasi default 1 detik
  }) : super(
          // pageBuilder menentukan widget apa yang akan ditampilkan pada layar.
          // Parameter:
          // - context: BuildContext saat ini.
          // - animation: animasi utama untuk transisi masuk.
          // - secondaryAnimation: animasi untuk rute sebelumnya (jika ada).
          pageBuilder: (context, animation, secondaryAnimation) => page,
          
          // transitionDuration mengatur berapa lama animasi masuk (push) berlangsung.
          transitionDuration: duration,
          // reverseTransitionDuration mengatur berapa lama animasi keluar (pop) berlangsung.
          reverseTransitionDuration: duration,
          
          // transitionsBuilder menentukan bagaimana animasi transisi dijalankan.
          // Parameter:
          // - context: BuildContext.
          // - animation: animasi utama dengan nilai 0.0 → 1.0 saat transisi masuk.
          // - secondaryAnimation: animasi untuk halaman sebelumnya (tidak dipakai di sini).
          // - child: widget yang dibangun oleh pageBuilder (yakni `page`).
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Align(
              // Menempatkan widget secara terpusat (center) selama animasi.
              alignment: Alignment.center,
              child: SizeTransition(
                // SizeTransition mengubah skala (height/width) widget secara animatif.
                // sizeFactor merujuk pada nilai `animation` (0.0 → 1.0).
                sizeFactor: animation,
                child: child, // Widget halaman yang akan dianimasikan ukurannya.
              ),
            );
          },
        );
}
