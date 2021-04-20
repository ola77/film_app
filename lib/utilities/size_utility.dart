// import 'package:flutter/material.dart';
// class UIUtills {
//   factory UIUtills() {
//     return _singleton;
//   }
//   static final UIUtills _singleton = UIUtills._internal();
//   UIUtills._internal() {
//   }
// //region Screen Size and Proportional according to device
//   double _screenHeight;
//   double _screenWidth;
//   double get screenHeight => _screenHeight;
//   double get screenWidth => _screenWidth;
//   final double _referenceScreenHeight = 759.3;
//   final double _referenceScreenWidth = 392.7;
//   void updateScreenDimension({double width, double height}) {
//     _screenWidth = (width != null) ? width : _screenWidth;
//     _screenHeight = (height != null) ? height : _screenHeight;
//   }
//   double getProportionalHeight(double height) {
//     if (_screenHeight == null) return height;
//     return _screenHeight * height / _referenceScreenHeight;
//   }
//   double getProportionalWidth(double width) {
//     if (_screenWidth == null) return width;
//     var w = _screenWidth * width / _referenceScreenWidth;
//     return w.ceilToDouble();
//   }
// //endregion
// //region TextStyle
//   TextStyle getTextStyleRegular(
//       {String fontName = 'Roboto-Regular',
//         int fontsize = 12,
//         Color color,
//         bool isChangeAccordingToDeviceSize = true,
//         double characterSpacing,
//         double lineSpacing}) {
//     double finalFontsize = fontsize.toDouble();
//     if (isChangeAccordingToDeviceSize && this._screenWidth != null) {
//       finalFontsize = (finalFontsize * _screenWidth) / _referenceScreenWidth;
//     }
//     if (characterSpacing != null) {
//       return TextStyle(
//           fontSize: finalFontsize,
//           fontFamily: fontName,
//           color: color,
//           letterSpacing: characterSpacing);
//     } else if (lineSpacing != null) {
//       return TextStyle(
//           fontSize: finalFontsize,
//           fontFamily: fontName,
//           color: color,
//           height: lineSpacing);
//     }
//     return TextStyle(
//         fontSize: finalFontsize, fontFamily: fontName, color: color);
//   }
// }