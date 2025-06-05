// File: lib/utils/positioned_tween_configs.dart

// Mengimpor paket Flutter yang berisi kelas RelativeRect.
import 'package:flutter/material.dart';

// Kelas untuk menyimpan konfigurasi tween dengan nilai awal (begin) dan akhir (end)
// dalam bentuk RelativeRect, yang digunakan oleh PositionedTransition.
class TweenConfig {
  // Properti untuk posisi awal RelativeRect.
  final RelativeRect begin;
  // Properti untuk posisi akhir RelativeRect.
  final RelativeRect end;

  // Konstruktor konstanta yang menginisialisasi nilai begin dan end.
  const TweenConfig(this.begin, this.end);
}

/// Konfigurasi animasi untuk Jerry.
/// Jerry bergerak dari (left: 0, top: 0) → (left: 300, top: 300).
const jerryConfig = TweenConfig(
  // RelativeRect.fromLTRB(left, top, right, bottom).
  // Di sini right dan bottom diatur 0 agar tidak mempengaruhi posisi.
  RelativeRect.fromLTRB(0, 0, 0, 0),      // Posisi awal: (0,0)
  RelativeRect.fromLTRB(300, 300, 0, 0),  // Posisi akhir: (300,300)
);

/// Konfigurasi animasi untuk Tom.
/// Tom bergerak dari (0,0) → (150,150).
const tomConfig = TweenConfig(
  RelativeRect.fromLTRB(0, 0, 0, 0),      // Posisi awal: (0,0)
  RelativeRect.fromLTRB(150, 150, 0, 0),  // Posisi akhir: (150,150)
);

/// Konfigurasi animasi untuk Spike.
/// Spike bergerak dari (0,0) → (50,50).
const spikeConfig = TweenConfig(
  RelativeRect.fromLTRB(0, 0, 0, 0),     // Posisi awal: (0,0)
  RelativeRect.fromLTRB(50, 50, 0, 0),   // Posisi akhir: (50,50)
);
