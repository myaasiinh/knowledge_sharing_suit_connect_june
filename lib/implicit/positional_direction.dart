// File: lib/pages/animated_positioned_directional_example.dart

// Mengimpor paket Flutter yang berisi widget, layout, dan utilitas Material Design.
import 'package:flutter/material.dart';
// Mengimpor helper untuk menghitung posisi baru berdasarkan arah (move).
import 'position_helper.dart';
// Mengimpor controller terkait penanganan enum MoveDirection (lokasi file mungkin berisi definisi MoveDirection).
import 'positioned_controller.dart';

// Mendefinisikan StatefulWidget bernama AnimatedPositionedDirectionalExample.
// Widget ini akan menampilkan contoh penggunaan AnimatedPositionedDirectional
// untuk memindahkan sebuah kotak (gambar) secara animatif ke berbagai arah.
class AnimatedPositionedDirectionalExample extends StatefulWidget {
  // Konstruktor konstanta dengan key opsional.
  const AnimatedPositionedDirectionalExample({super.key});

  @override
  State<AnimatedPositionedDirectionalExample> createState() =>
      _AnimatedPositionedDirectionalExampleState();
}

// State kelas untuk AnimatedPositionedDirectionalExample.
// Di sini disimpan logika serta tampilan utama widget.
class _AnimatedPositionedDirectionalExampleState
    extends State<AnimatedPositionedDirectionalExample> {
  // Menyimpan posisi saat ini sebagai Offset (x, y), diinisialisasi (0,0).
  Offset _position = Offset.zero;

  // Jarak (dalam pixel) setiap kali bergerak ke satu arah.
  static const double _step = 50.0;

  // Ukuran kotak (width x height) yang akan dipindahkan.
  static const Size _boxSize = Size(100, 100);

  // Metode untuk memindahkan kotak berdasarkan MoveDirection.
  void _move(MoveDirection dir) {
    // Mengambil ukuran layar (width dan height) dari MediaQuery.
    final media = MediaQuery.of(context).size;

    // 1) Hitung posisi mentah baru berdasarkan arah dan langkah (_step).
    final newPos = applyDirection(
      current: _position,  // Posisi saat ini
      direction: dir,      // Arah gerak (kiri, kanan, atas, bawah)
      step: _step,         // Jarak per langkah
    );

    // 2) Lakukan clamp pada posisi X agar tidak keluar dari layar:
    //    batas bawah = 0, batas atas = screenWidth - widgetWidth.
    final clampedX = clampHorizontal(
      value: newPos.dx,                  // Koordinat X mentah
      screenWidth: media.width,          // Lebar layar
      widgetWidth: _boxSize.width,       // Lebar kotak (untuk mencegah keluar layar)
    );

    // Lakukan clamp pada posisi Y agar tidak keluar dari layar:
    //    batas bawah = 0, batas atas = (screenHeight - AppBar) - (widgetHeight + padding).
    final clampedY = clampVertical(
      value: newPos.dy,                               // Koordinat Y mentah
      screenHeight: media.height - kToolbarHeight,    // Tinggi layar dikurangi AppBar
      widgetHeight: _boxSize.height + 16,             // Tinggi kotak + padding sekitar
    );

    // Memperbarui state dengan posisi baru yang sudah dikelamp (clamped).
    setState(() {
      _position = Offset(clampedX, clampedY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar berisi judul sederhana.
      appBar: AppBar(title: const Text("Animated Positioned Directional")),
      // Area utama body dengan padding di semua sisi.
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Menggunakan Stack untuk menumpuk widget satu di atas lainnya.
        child: Stack(
          children: [
            // AnimatedPositionedDirectional untuk memposisikan kotak secara animatif.
            AnimatedPositionedDirectional(
              // Properti start dan top menentukan posisi horizontal (x) dan vertikal (y).
              // Di sini start diisi dengan _position.dx, top diisi dengan _position.dy.
              start: _position.dx,
              top: _position.dy,
              // Durasi animasi perpindahan: 300ms.
              duration: const Duration(milliseconds: 300),
              // Child widget yang akan dipindahkan: SizedBox yang menampung gambar Jerry.
              child: SizedBox(
                width: _boxSize.width,   // Lebar kotak
                height: _boxSize.height, // Tinggi kotak
                child: Image.asset("assets/jerry.png"), // Asset gambar
              ),
            ),
            // Align untuk menempatkan tombol-tombol arah di bagian bawah tengah layar.
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                // Mengatur jarak antar tombol sama rata.
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Membuat daftar tombol berdasarkan enum MoveDirection.
                children: MoveDirection.values.map((dir) {
                  // Memilih ikon yang sesuai dengan arah saat ini.
                  final icon = {
                    MoveDirection.left: Icons.arrow_left,
                    MoveDirection.right: Icons.arrow_right,
                    MoveDirection.up: Icons.arrow_upward,
                    MoveDirection.down: Icons.arrow_downward,
                  }[dir]!;

                  // Mengembalikan ElevatedButton untuk setiap arah.
                  return ElevatedButton(
                    // Saat ditekan, panggil metode _move dengan arah yang sesuai.
                    onPressed: () => _move(dir),
                    // Menampilkan ikon panah pada tombol.
                    child: Icon(icon),
                  );
                }).toList(), // Ubah Iterable menjadi List<Widget>.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
