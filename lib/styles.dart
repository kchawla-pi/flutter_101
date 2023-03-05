import 'package:flutter/material.dart';

Color hex2Color(String code) {
  return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
}

class Styles {
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;
  static const _fontNameDefault = "CascadiaCode";
  static final Color _textColorStrong = hex2Color('000000');
  static final Color _textColorDefault = hex2Color('666666');

  static const navBarTitle = TextStyle(
    fontFamily: _fontNameDefault,
  );
  static final headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: _textColorStrong,
  );
  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );
}
