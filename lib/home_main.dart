import 'package:flutter/material.dart';  // Mengimpor paket Flutter dasar untuk widget dan utilitas Material Design
import 'explicit/inexed_stack_transition.dart';  // Mengimpor halaman contoh untuk IndexedStack transition
import 'explicit/positioned_transition.dart';     // Mengimpor halaman contoh untuk Positioned transition
import 'implicit/animated_align_example.dart';    // Mengimpor halaman contoh untuk AnimatedAlign
import 'implicit/positional_direction.dart';      // Mengimpor halaman contoh untuk AnimatedPositionedDirectional
import 'low_level_custom/custom_paint.dart';      // Mengimpor halaman contoh CustomPaint
import 'page_transition/page_mix_fade_size_transition.dart';  // Mengimpor halaman contoh untuk PageMixSizeFadeTransition
import 'page_transition/page_size_transition.dart';           // Mengimpor halaman contoh untuk PageSizeTransition
import 'page_transition/page_two.dart';                        // Mengimpor halaman target PageTwo
import 'third_party/lottie_animation.dart';    
class MyHomePage extends StatefulWidget {  // Mendefinisikan widget yang mendukung perubahan state
  const MyHomePage({super.key});  // Konstruktor konstanta, menerima key opsional

  @override
  State<MyHomePage> createState() => _MyHomePageState();  // Membuat state terkait
}

class _MyHomePageState extends State<MyHomePage> {  // State untuk MyHomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Knowledge Sharing 5 June"),  // Judul AppBar pada layar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Menambahkan padding di semua sisi: 16px
        child: ListView(
          physics: const BouncingScrollPhysics(),  // Memberikan efek scroll memantul
          children: [
            // Tombol 1: Navigasi ke halaman AnimatedAlignExample
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),  // Jarak vertikal 8px di atas dan bawah tombol
              child: ElevatedButton(
                onPressed: () {
                  // Ketika ditekan, pindah ke AnimatedAlignExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedAlignExample(),
                    ),
                  );
                },
                child: const Text("Animated Align Example"),
              ),
            ),
            // Tombol 2: Navigasi ke halaman AnimatedPositionedDirectionalExample
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Ketika ditekan, pindah ke AnimatedPositionedDirectionalExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AnimatedPositionedDirectionalExample(),
                    ),
                  );
                },
                child: const Text("Animated Positioned Directional Example"),
              ),
            ),
            // Tombol 3: Navigasi ke halaman PositionedTransitionExample (warna merah)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Ketika ditekan, pindah ke PositionedTransitionExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PositionedTransitionExample(),
                    ),
                  );
                },
                child: const Text("Positioned Transition Example"),
              ),
            ),
            // Tombol 4: Navigasi ke halaman IndexedStackTransitionExample (warna merah)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Ketika ditekan, pindah ke IndexedStackTransitionExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const IndexedStackTransitionExample(),
                    ),
                  );
                },
                child: const Text("Indexed Stack Transition Example"),
              ),
            ),
            // Tombol 5: Navigasi menggunakan PageSizeTransition ke PageTwo (warna hitam)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  // Ketika ditekan, gunakan custom PageRoute PageSizeTransition
                  Navigator.of(context)
                      .push(PageSizeTransition(const PageTwo()));
                },
                child: const Text(
                  "Page Size Transition",
                  style: TextStyle(color: Colors.white),  // Warna teks putih agar kontras dengan latar hitam
                ),
              ),
            ),
            // Tombol 6: Navigasi menggunakan PageMixSizeFadeTransition ke PageTwo (warna hitam)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  // Ketika ditekan, gunakan custom PageRoute PageMixSizeFadeTransition
                  Navigator.of(context)
                      .push(PageMixSizeFadeTransition(const PageTwo()));
                },
                child: const Text(
                  "Page Mix Size Fade Transition",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // Tombol 7: Navigasi ke halaman CustomPainterExample (warna hijau)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Ketika ditekan, pindah ke CustomPainterExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomPainterExample(),
                    ),
                  );
                },
                child: const Text(
                  "Custom Painter Example",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // Tombol 8: Navigasi ke halaman LottieSliderExample (warna hijau)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Ketika ditekan, pindah ke LottieSliderExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LottieSliderExample(),
                    ),
                  );
                },
                child: const Text(
                  "Lottie Slide Example",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
