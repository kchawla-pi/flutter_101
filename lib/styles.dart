import 'package:flutter/material.dart';

Color hex2Color(String code) {
  return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
}

class Styles {
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;

  static final _textColorStrong = hex2Color('000000');
  static final _textColorDefault = hex2Color('666666');

  static final headerLarge = TextStyle(
    fontSize: _textSizeLarge,
    color: _textColorStrong,
  );
  static final textDefault = TextStyle(
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );
}
