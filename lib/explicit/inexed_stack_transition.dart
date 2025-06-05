// File: lib/pages/indexed_stack_transition_example.dart

// Mengimpor paket Flutter yang berisi widget, layout, dan utilitas Material Design.
import 'package:flutter/material.dart';
// Mengimpor helper untuk animasi IndexedStackTransition.
import 'inexed_stack_helper.dart';

// Mendefinisikan StatefulWidget bernama IndexedStackTransitionExample.
// Widget ini akan menampilkan contoh penggunaan IndexedStack dengan animasi perpindahan child.
class IndexedStackTransitionExample extends StatefulWidget {
  // Konstruktor konstanta dengan key opsional.
  const IndexedStackTransitionExample({super.key});

  @override
  State<IndexedStackTransitionExample> createState() =>
      _IndexedStackTransitionExampleState();
}

// State terkait untuk IndexedStackTransitionExample.
// Mewarisi SingleTickerProviderStateMixin untuk memberikan vsync ke AnimationController.
class _IndexedStackTransitionExampleState
    extends State<IndexedStackTransitionExample>
    with SingleTickerProviderStateMixin {
  // Properti animator yang akan mengendalikan animasi opacity dan scale.
  late final IndexedStackTransitionHelper _animator;

  @override
  void initState() {
    super.initState();
    // Inisialisasi animator dengan vsync = this (State sebagai TickerProvider).
    _animator = IndexedStackTransitionHelper(vsync: this);
  }

  @override
  void dispose() {
    // Dispose animator saat widget dihapus untuk menghindari memory leak.
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul “IndexedStack Transition”.
      appBar: AppBar(title: const Text("IndexedStack Transition")),
      // Body berisi IndexedStack yang menampilkan satu child berdasarkan currentIndex animator.
      body: IndexedStack(
        index: _animator.currentIndex, // Menentukan child yang aktif dari animator.
        children: [
          // Membangun child pertama dengan latar merah dan gambar Jerry.
          _buildChild(Colors.red,   "assets/jerry.png"),
          // Membangun child kedua dengan latar biru dan gambar anjing.
          _buildChild(Colors.blue,  "assets/dog.png"),
          // Membangun child ketiga dengan latar hijau dan gambar Tom.
          _buildChild(Colors.green, "assets/tom.png"),
        ],
      ),
      // FloatingActionButton di pojok bawah untuk berpindah ke child berikutnya.
      floatingActionButton: FloatingActionButton(
        // Saat ditekan, panggil goToNext dari animator dan panggil setState untuk rebuild.
        onPressed: () {
          setState(_animator.goToNext);
        },
        // Ikon panah ke bawah pada tombol.
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }

  // Metode pembantu untuk membangun setiap child pada IndexedStack.
  // Menerima warna latar (bg) dan path asset gambar (asset).
  Widget _buildChild(Color bg, String asset) {
    return ScaleTransition(
      // Menggunakan tween scale dari animator untuk efek zoom in/out.
      scale: _animator.scale,
      child: FadeTransition(
        // Menggunakan tween opacity dari animator untuk efek fade in/out.
        opacity: _animator.opacity,
        child: Container(
          color: bg,                    // Menetapkan warna latar sesuai parameter.
          alignment: Alignment.center,  // Menempatkan gambar di tengah container.
          child: Image.asset(asset),    // Menampilkan gambar dari asset.
        ),
      ),
    );
  }
}
