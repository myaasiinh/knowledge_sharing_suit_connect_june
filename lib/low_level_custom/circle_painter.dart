// Mengimpor paket Flutter dasar yang berisi widget, elemen grafis, dan utilitas menggambar.
import 'package:flutter/material.dart';

// Mendefinisikan kelas CirclePainter yang memperluas CustomPainter.
// CustomPainter digunakan untuk menggambar bentuk atau grafik kustom pada kanvas.
class CirclePainter extends CustomPainter {
  // Properti untuk menyimpan radius (jari-jari) lingkaran.
  final double radius;
  // Properti untuk menyimpan warna lingkaran.
  final Color color;

  // Konstruktor CirclePainter menerima dua parameter:
  // - radius: jari-jari lingkaran
  // - color: warna lingkaran
  CirclePainter(
    this.radius, 
    this.color,
  );

  // Metode paint dipanggil oleh framework Flutter untuk menggambar pada kanvas.
  // Parameter:
  // - canvas: objek Canvas tempat menggambar
  // - size: ukuran area (lebar & tinggi) yang tersedia untuk menggambar
  @override
  void paint(
    Canvas canvas, Size size,
  ) {
    // Membuat objek Paint untuk mengatur gaya dan warna lukisan.
    final paint = Paint()
      ..color = color                 // Menetapkan warna fill sesuai properti color
      ..style = PaintingStyle.fill;   // Mengatur style menjadi fill (mengisi area lingkaran)

    // Menggambar lingkaran pada canvas:
    canvas.drawCircle(
      Offset(
        size.width / 2,               // Menentukan posisi X: titik tengah lebar canvas
        size.height / 2,              // Menentukan posisi Y: titik tengah tinggi canvas
      ),
      radius,                         // Menentukan jari-jari lingkaran
      paint,                          // Menggunakan objek paint yang telah diatur
    );
  }

  // Metode shouldRepaint dipanggil setiap kali framework perlu memeriksa
  // apakah objek painter baru wajib menggantikan yang lama.
  // Parameter:
  // - old: instansi CirclePainter sebelumnya untuk dibandingkan.
  @override
  bool shouldRepaint(
    covariant CirclePainter old,
  ) {
    // Kembalikan true jika radius atau warna berubah,
    // sehingga Flutter akan memanggil paint() ulang.
    return radius != old.radius 
        || color != old.color;
  }
}
