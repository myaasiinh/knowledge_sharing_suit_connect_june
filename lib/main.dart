import 'package:flutter/material.dart';
import 'home_main.dart';  // Mengimpor paket Flutter dasar untuk widget dan utilitas Material Design
                    // Mengimpor halaman contoh Lottie animation
void main() {
  runApp(const MyApp());  // Titik awal aplikasi: menjalankan widget MyApp
}

class MyApp extends StatelessWidget {  // Mendefinisikan widget utama yang bersifat stateless
  const MyApp({super.key});  // Konstruktor konstanta, menerima key opsional

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Course',  // Judul aplikasi (tidak selalu terlihat di layar)
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Tema utama dengan warna biru
      ),
      home: const MyHomePage(),  // Menetapkan MyHomePage sebagai halaman awal (home)
    );
  }
}
