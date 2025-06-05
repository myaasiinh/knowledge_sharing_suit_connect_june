// Mengimpor paket Flutter yang berisi widget, layout, dan utilitas Material Design.
import 'package:flutter/material.dart';
// Mengimpor helper yang berisi konfigurasi animasi untuk PositionedTransition.
import 'animation_helper.dart';

// Mendefinisikan StatefulWidget bernama PositionedTransitionExample.
// Widget ini akan menampilkan contoh penggunaan PositionedTransition untuk animasi posisi.
class PositionedTransitionExample extends StatefulWidget {
  // Konstruktor konstanta dengan key opsional.
  const PositionedTransitionExample({super.key});

  @override
  State<PositionedTransitionExample> createState() =>
      _PositionedTransitionExampleState();
}

// State terkait untuk PositionedTransitionExample.
// Mewarisi SingleTickerProviderStateMixin agar bisa menyediakan vsync untuk AnimationController.
class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample>
    with SingleTickerProviderStateMixin {

  // Properti untuk menyimpan instance PositionedAnimations yang mengatur animasi posisi.
  late final PositionedAnimations _animations;

  @override
  void initState() {
    super.initState();
    // Inisialisasi PositionedAnimations dengan vsync = this (State sebagai TickerProvider).
    // Ini akan membuat AnimationController dan tween untuk jerry, tom, spike.
    _animations = PositionedAnimations(vsync: this);
  }

  @override
  void dispose() {
    // Dispose AnimationController di dalam PositionedAnimations untuk menghindari memory leak.
    _animations.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar layar dengan AppBar dan body.
    return Scaffold(
      // AppBar dengan judul sederhana.
      appBar: AppBar(title: const Text("Positioned Transition Example")),
      // Body menggunakan Stack untuk menumpuk widget dan memposisikannya secara animatif.
      body: Stack(
        children: [
          // PositionedTransition untuk karakter Spike (anjing).
          // 'rect' adalah Animation<RelativeRect> yang dihasilkan oleh _animations.spike.
          PositionedTransition(
            rect: _animations.spike,
            // Child adalah widget yang akan dianimasikan posisinya.
            child: _buildImageBox("assets/dog.png", Colors.blueGrey),
          ),
          // PositionedTransition untuk karakter Tom.
          PositionedTransition(
            rect: _animations.tom,
            child: _buildImageBox("assets/tom.png", Colors.grey),
          ),
          // PositionedTransition untuk karakter Jerry.
          PositionedTransition(
            rect: _animations.jerry,
            child: _buildImageBox("assets/jerry.png", Colors.orange),
          ),
          // Align untuk menempatkan kontrol tombol di bagian bawah tengah layar.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              // Memberi jarak bawah 24 pixel agar tidak terlalu menempel ke tepi layar.
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                // Mengatur tombol-tombol dengan spasi merata di seluruh lebar.
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol untuk memulai animasi (forward).
                  ElevatedButton(
                    onPressed: _animations.forward, // Panggil metode forward() ketika ditekan.
                    child: const Icon(Icons.play_arrow), // Ikon play.
                  ),
                  // Tombol untuk memutar ulang animasi dari akhir (reverse).
                  ElevatedButton(
                    onPressed: _animations.reverse, // Panggil metode reverse() ketika ditekan.
                    child: const Icon(Icons.replay), // Ikon replay.
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Metode helper untuk membangun kotak berisi gambar dengan warna latar tertentu.
  /// 
  /// [asset]: path aset gambar yang akan ditampilkan.
  /// [bg]: warna latar kotak.
  Widget _buildImageBox(String asset, Color bg) {
    return Container(
      width: 100,       // Lebar kotak 100 piksel.
      height: 100,      // Tinggi kotak 100 piksel.
      color: bg,        // Menetapkan warna latar sesuai parameter.
      child: Image.asset(asset), // Menampilkan gambar dari aset.
    );
  }
}
