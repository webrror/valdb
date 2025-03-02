import 'dart:ui';

List<Color> convertHexToColorList(List<String> hexColors) {
  return hexColors.map((hex) => _hexToColor(hex)).toList();
}

Color _hexToColor(String hex) {
  // Parse the hex string to an integer and convert it to a Color object.
  return Color(int.tryParse('0xff${hex.substring(0, 6)}') ?? 0);
}
