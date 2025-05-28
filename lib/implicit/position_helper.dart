// lib/utils/clamp_helper.dart

/// Clamps a horizontal [value] between 0 and (screenWidth - widgetWidth).
double clampHorizontal({
  required double value,
  required double screenWidth,
  required double widgetWidth,
}) {
  return value.clamp(0.0, screenWidth - widgetWidth);
}

/// Clamps a vertical [value] between 0 and (screenHeight - widgetHeight).
double clampVertical({
  required double value,
  required double screenHeight,
  required double widgetHeight,
}) {
  return value.clamp(0.0, screenHeight - widgetHeight);
}
