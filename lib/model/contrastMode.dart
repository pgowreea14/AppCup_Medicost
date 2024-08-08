import 'package:flutter/material.dart';

enum FontStyleOption { High, Medium, Low }

class FontStyleProvider with ChangeNotifier {
  FontStyleOption _fontStyleOption = FontStyleOption.Medium;

  FontStyleOption get fontStyleOption => _fontStyleOption;

  void setFontStyle(FontStyleOption option) {
    _fontStyleOption = option;
    notifyListeners();
  }

  TextStyle getTextStyle() {
    switch (_fontStyleOption) {
      case FontStyleOption.High:
        return TextStyle(fontSize: 50.0);
      case FontStyleOption.Medium:
        return TextStyle(fontSize: 20.0);
      case FontStyleOption.Low:
        return TextStyle(fontSize: 10.0);
      default:
        return TextStyle(fontSize: 16.0);
    }
  }
}
