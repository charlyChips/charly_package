bool? nullExtensions;

extension DoubleNullExt on double? {
  double value([double defaultValue = 0.0]) {
    return this ?? defaultValue;
  }
}

extension StringNullExt on String? {
  String value([String defaultValue = '']) {
    return this ?? defaultValue;
  }
}

extension IntNullExt on int? {
  int value([int defaultValue = 0]) {
    return this ?? defaultValue;
  }
}

extension BoolNullExt on bool? {
  bool value([bool defaultValue = false]) {
    return this ?? defaultValue;
  }
}
