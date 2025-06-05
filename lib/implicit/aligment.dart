// Mengimpor paket Flutter yang berisi widget dan utilitas Material Design.
import 'package:flutter/material.dart';

// Daftar konstan berisi semua nilai Alignment yang akan di-cycle (diputar).
const List<Alignment> _alignmentCycle = [
  Alignment.topLeft,      // Posisi pojok kiri atas
  Alignment.topCenter,    // Posisi tengah atas
  Alignment.topRight,     // Posisi pojok kanan atas
  Alignment.centerLeft,   // Posisi tengah kiri
  Alignment.center,       // Posisi tepat di tengah
  Alignment.centerRight,  // Posisi tengah kanan
  Alignment.bottomLeft,   // Posisi pojok kiri bawah
  Alignment.bottomCenter, // Posisi tengah bawah
  Alignment.bottomRight,  // Posisi pojok kanan bawah
];

// Keterangan fungsi: Mengembalikan Alignment berikutnya dalam siklus berdasarkan nilai [step].
// 
// Secara internal, fungsi ini melakukan operasi modulo dengan panjang [_alignmentCycle],
// sehingga ketika [step] melebihi indeks terakhir, ia otomatis kembali ke awal.
Alignment getNextAlignment(int step) {
  // Hitung indeks dalam daftar dengan operasi modulo agar selalu berada pada rentang valid
  final index = step % _alignmentCycle.length;
  // Kembalikan Alignment pada posisi indeks yang dihitung
  return _alignmentCycle[index];
}
