// File: lib/utils/clamp_helper.dart

/// Mengunci (clamp) nilai horizontal [value] agar berada di antara 0 dan (screenWidth - widgetWidth).
/// 
/// Parameter:
/// - [value]: Nilai horizontal yang ingin dikunci.
/// - [screenWidth]: Lebar layar atau area total tempat widget dapat bergerak.
/// - [widgetWidth]: Lebar widget yang akan dibatasi gerakannya.
/// 
/// Mengembalikan nilai yang telah dikunci antara 0 dan batas kanan (screenWidth - widgetWidth).
double clampHorizontal({
  required double value,        // Nilai horizontal awal sebelum dikunci
  required double screenWidth,  // Lebar layar atau area total
  required double widgetWidth,  // Lebar widget yang gerakannya dibatasi
}) {
  // Memakai metode clamp pada double untuk membatasi nilai antara 0.0 dan (screenWidth - widgetWidth).
  return value.clamp(0.0, screenWidth - widgetWidth);
}

/// Mengunci (clamp) nilai vertikal [value] agar berada di antara 0 dan (screenHeight - widgetHeight).
/// 
/// Parameter:
/// - [value]: Nilai vertikal yang ingin dikunci.
/// - [screenHeight]: Tinggi layar atau area total tempat widget dapat bergerak.
/// - [widgetHeight]: Tinggi widget yang akan dibatasi gerakannya.
/// 
/// Mengembalikan nilai yang telah dikunci antara 0 dan batas bawah (screenHeight - widgetHeight).
double clampVertical({
  required double value,         // Nilai vertikal awal sebelum dikunci
  required double screenHeight,  // Tinggi layar atau area total
  required double widgetHeight,  // Tinggi widget yang gerakannya dibatasi
}) {
  // Memakai metode clamp pada double untuk membatasi nilai antara 0.0 dan (screenHeight - widgetHeight).
  return value.clamp(0.0, screenHeight - widgetHeight);
}
