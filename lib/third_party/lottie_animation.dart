// File: lib/pages/lottie_slider_example.dart

// Mengimpor paket Flutter dasar untuk widget, layout, dan utilitas Material Design.
import 'package:flutter/material.dart';
// Mengimpor paket Lottie untuk menampilkan animasi Lottie di Flutter.
import 'package:lottie/lottie.dart';
// Mengimpor konfigurasi slider yang berisi daftar path animasi Lottie.
import 'slider_config.dart';
// Mengimpor helper yang menangani logika PageController dan pergerakan slider.
import 'slider_helper.dart';

// Mendefinisikan StatefulWidget bernama LottieSliderExample.
// Widget ini akan menampilkan contoh penggunaan PageView dengan animasi Lottie
// dan BottomNavigationBar untuk navigasi antar halaman animasi.
class LottieSliderExample extends StatefulWidget {
  // Konstruktor konstanta dengan key opsional.
  const LottieSliderExample({super.key});

  @override
  State<LottieSliderExample> createState() => _LottieSliderExampleState();
}

// State dari LottieSliderExample, cocok untuk mengelola PageController LottieSliderHelper.
class _LottieSliderExampleState extends State<LottieSliderExample> {
  // Properti helper yang menangani PageController dan status halaman saat ini.
  late final LottieSliderHelper _slider;

  @override
  void initState() {
    super.initState();
    // Inisialisasi LottieSliderHelper dan langsung memulai controller-nya.
    // Metode start() di dalam helper biasanya melakukan inisialisasi PageController.
    _slider = LottieSliderHelper()..start();
  }

  @override
  void dispose() {
    // Dispose helper untuk membersihkan PageController agar tidak terjadi memory leak.
    _slider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul “Lottie Slider Example”.
      appBar: AppBar(title: const Text("Lottie Slider Example")),
      // Body menggunakan PageView.builder untuk menampilkan animasi Lottie bergantian.
      body: PageView.builder(
        // Menghubungkan PageView dengan controller dari helper (_slider.controller).
        controller: _slider.controller,
        // Dipanggil setiap kali pengguna menggeser ke halaman lain.
        onPageChanged: (page) {
          // Memperbarui currentPage di helper dan memanggil setState untuk rebuild.
          setState(() {
            _slider.currentPage = page;
          });
        },
        // Jumlah halaman berdasarkan jumlah path animasi yang didefinisikan di slider_config.dart.
        itemCount: lottieAnimationPaths.length,
        // Menghasilkan widget untuk setiap halaman ke-i.
        itemBuilder: (_, i) => Center(
          // Menampilkan animasi Lottie dari path yang sesuai.
          child: Lottie.asset(
            lottieAnimationPaths[i], // Path ke file Lottie JSON
            repeat: true,            // Mengulang animasi terus-menerus
            reverse: false,          // Tidak memutar animasi secara terbalik
          ),
        ),
      ),
      // BottomNavigationBar untuk menyediakan tombol navigasi antar halaman PageView.
      bottomNavigationBar: BottomNavigationBar(
        // Menentukan indeks yang aktif sesuai currentPage di helper.
        currentIndex: _slider.currentPage,
        // Dipanggil saat pengguna menekan salah satu item di BottomNavigationBar.
        onTap: (page) {
          // Memanggil setState agar widget rebuild (meski tidak banyak berubah).
          setState(() {});
          // Mengarahkan PageController ke halaman yang ditekan.
          _slider.jumpTo(page);
        },
        // Daftar BottomNavigationBarItem, satu untuk setiap animasi.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.animation_outlined), // Ikon untuk animasi 1
            label: "Animation 1",                 // Label di bawah ikon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_medium),   // Ikon untuk animasi 2
            label: "Animation 2",                  // Label di bawah ikon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),          // Ikon untuk animasi 3
            label: "Animation 3",                  // Label di bawah ikon
          ),
        ],
      ),
    );
  }
}
