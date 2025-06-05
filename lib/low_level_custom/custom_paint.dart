// Mengimpor paket Flutter dasar untuk widget, layout, dan material design.
import 'package:flutter/material.dart';
// Mengimpor file yang berisi definisi CirclePainter (menggambar lingkaran).
import 'circle_painter.dart';
// Mengimpor file yang berisi kelas CustomPainterAnimations (animasi ukuran & warna).
import 'custom_paint_animator.dart';

// Mendefinisikan StatefulWidget bernama CustomPainterExample.
// Digunakan untuk menampilkan contoh penggunaan CustomPaint dengan animasi.
class CustomPainterExample extends StatefulWidget {
  const CustomPainterExample({super.key});

  @override
  State<CustomPainterExample> createState() => _CustomPainterExampleState();
}

// State untuk widget CustomPainterExample.
// Mewarisi SingleTickerProviderStateMixin untuk menyediakan vsync bagi AnimationController.
class _CustomPainterExampleState extends State<CustomPainterExample>
    with SingleTickerProviderStateMixin {
  // Properti untuk menyimpan instance CustomPainterAnimations yang akan mengatur animasi.
  late final CustomPainterAnimations _anim;

  @override
  void initState() {
    super.initState();
    // Inisialisasi CustomPainterAnimations dengan vsync (TickerProvider) = this State.
    // Ini memulai animasi secara otomatis (karena di dalam CustomPainterAnimations controller.repeat()).
    _anim = CustomPainterAnimations(vsync: this);
  }

  @override
  void dispose() {
    // Dispose-kan controller animasi agar tidak terjadi kebocoran memori saat widget dihapus.
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar dengan judul sederhana.
      appBar: AppBar(title: const Text("Custom Painter Example")),
      body: Center(
        // AnimatedBuilder mendengarkan perubahan pada _anim.controller,
        // dan membangun ulang subtree di setiap frame animasi.
        child: AnimatedBuilder(
          animation: _anim.controller,
          builder: (_, __) => CustomPaint(
            // CustomPaint menggunakan CirclePainter sebagai painter.
            // CirclePainter menerima dua parameter:
            // - ukuran lingkaran (radius) dari animasi size
            // - warna lingkaran dari animasi color
            painter: CirclePainter(
              _anim.size.value,               // Mengambil nilai ukuran saat ini
              _anim.color.value ?? Colors.red, // Mengambil nilai warna saat ini (fallback red)
            ),
            // Ukuran kanvas tempat menggambar lingkaran: kotak 200x200 pixel.
            size: const Size.square(200),
          ),
        ),
      ),
    );
  }
}
