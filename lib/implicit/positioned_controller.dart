// File: lib/utils/direction_helper.dart

// Mengimpor paket Flutter yang diperlukan untuk menggunakan kelas Offset.
import 'package:flutter/material.dart';

/// Empat arah gerak utama (kiri, kanan, atas, bawah).
enum MoveDirection { left, right, up, down }

/// Menerapkan [direction] pada posisi saat ini ([current]) dengan jarak [step] piksel,
/// mengembalikan Offset baru yang belum di‐clamp (belum dibatasi agar tetap dalam layar).
Offset applyDirection({
  required Offset current,         // Posisi awal (koordinat x, y)
  required MoveDirection direction,// Arah gerak yang ingin diterapkan
  required double step,            // Jarak dalam piksel untuk bergerak
}) {
  switch (direction) {
    case MoveDirection.left:
      // Jika arah kiri, kurangi nilai x sebesar step, y tetap sama.
      return Offset(current.dx - step, current.dy);
    case MoveDirection.right:
      // Jika arah kanan, tambahkan nilai x sebesar step, y tetap sama.
      return Offset(current.dx + step, current.dy);
    case MoveDirection.up:
      // Jika arah atas, kurangi nilai y sebesar step, x tetap sama.
      return Offset(current.dx, current.dy - step);
    case MoveDirection.down:
      // Jika arah bawah, tambahkan nilai y sebesar step, x tetap sama.
      return Offset(current.dx, current.dy + step);
  }
}
