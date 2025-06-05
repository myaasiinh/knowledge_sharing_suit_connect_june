// Mengimpor paket Flutter dasar untuk membangun antarmuka pengguna.
import 'package:flutter/material.dart';

// Membuat kelas PageMixSizeFadeTransition yang memperluas PageRouteBuilder.
// Kelas ini digunakan untuk membuat rute halaman dengan animasi gabungan
// (SizeTransition + FadeTransition).
class PageMixSizeFadeTransition extends PageRouteBuilder {
  /// Widget halaman yang akan dipush (ditampilkan).
  final Widget page;

  /// Durasi animasi ketika melakukan transisi masuk (push) dan keluar (pop).
  final Duration duration;

  // Konstruktor utama untuk kelas ini.
  // - `this.page` menginisialisasi halaman yang akan ditampilkan.
  // - `this.duration` mengatur durasi animasi, dengan default 1000ms (1 detik).
  PageMixSizeFadeTransition(
    this.page, {
    this.duration = const Duration(milliseconds: 1000),  // ← nilai default durasi (1 detik)
  }) : super(
          // pageBuilder menentukan widget apa yang akan ditampilkan pada layar.
          // Parameter:
          // - context: BuildContext dari widget.
          // - animation: animasi transisi masuk.
          // - secondaryAnimation: animasi transisi halaman sebelumnya (bila ada).
          pageBuilder: (context, animation, secondaryAnimation) => page,
          
          // transitionDuration mengatur berapa lama animasi masuk (push) berlangsung.
          transitionDuration: duration,
          // reverseTransitionDuration mengatur berapa lama animasi keluar (pop) berlangsung.
          reverseTransitionDuration: duration,
          
          // transitionsBuilder menentukan bagaimana animasi transisi dijalankan.
          // Parameter:
          // - context: BuildContext.
          // - animation: animasi utama dari nilai 0.0 → 1.0 (untuk transisi masuk).
          // - secondaryAnimation: animasi untuk halaman sebelumnya (tidak dipakai di sini).
          // - child: widget yang dibangun oleh pageBuilder (yakni `page`).
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Align(
              // Menyusun widget di tengah (center) selama animasi.
              alignment: Alignment.center,
              child: SizeTransition(
                // SizeTransition mengubah skala (height/width) widget secara animatif.
                // sizeFactor mengacu ke nilai `animation` (0.0 → 1.0).
                sizeFactor: animation,
                child: FadeTransition(
                  // FadeTransition mengatur opasitas widget berdasarkan `animation`.
                  // Nilai opacity: 0.0 (transparan) → 1.0 (penuh).
                  opacity: animation,
                  child: child, // Widget halaman akhir yang akan dianimasikan.
                ),
              ),
            );
          },
        );
}
