// Mengimpor paket Flutter yang berisi widget dan utilitas Material Design.
import 'package:flutter/material.dart';
// Mengimpor file lokal yang berisi fungsi getNextAlignment untuk menentukan alignment selanjutnya.
import 'aligment.dart'; 

// Mendefinisikan StatefulWidget bernama AnimatedAlignExample.
// Widget ini akan menampilkan contoh penggunaan AnimatedAlign.
class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

// State terkait untuk AnimatedAlignExample.
// Di sinilah logika dan UI utama didefinisikan.
class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  // Properti untuk menyimpan langkah saat ini dalam siklus alignment.
  // Setiap kali _step bertambah, posisi widget akan berpindah sesuai urutan.
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul “Animated Align Example”.
      appBar: AppBar(title: const Text("Animated Align Example")),
      // Menggunakan Stack untuk menumpuk beberapa widget di atas satu sama lain.
      body: Stack(
        children: [
          // Widget pertama: AnimatedAlign untuk gambar Jerry.
          AnimatedAlign(
            // Menentukan posisi alignment berdasarkan nilai _step.
            alignment: getNextAlignment(_step),
            // Durasi animasi perubahan posisi: 400ms.
            duration: const Duration(milliseconds: 400),
            // Child yang dianimasikan: gambar Jerry dengan ukuran 100x100.
            child: Image.asset('assets/jerry.png', width: 100, height: 100),
          ),
          // Widget kedua: AnimatedAlign untuk gambar Tom.
          AnimatedAlign(
            // Menentukan posisi alignment berdasarkan nilai _step + 1,
            // sehingga Tom akan selalu berpindah satu langkah di belakang Jerry.
            alignment: getNextAlignment(_step + 1),
            // Durasi animasi perubahan posisi: 400ms.
            duration: const Duration(milliseconds: 400),
            // Child yang dianimasikan: gambar Tom dengan ukuran 100x100.
            child: Image.asset('assets/tom.png', width: 100, height: 100),
          ),
        ],
      ),
      // FloatingActionButton di pojok bawah yang men-trigger perubahan posisi.
      floatingActionButton: FloatingActionButton(
        // Ikon animasi untuk tombol.
        child: const Icon(Icons.animation),
        // Saat ditekan, _step bertambah satu dan panggil setState untuk memicu rebuild.
        onPressed: () => setState(() => _step++),
      ),
    );
  }
}
