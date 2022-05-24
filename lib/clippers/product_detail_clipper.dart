import 'package:flutter/material.dart';

class ProductDetailClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 1080;
    final double _yScaling = size.height / 1170;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      7.34 * _xScaling,
      155.78 * _yScaling,
      265.49 * _xScaling,
      155.78 * _yScaling,
    );
    path.cubicTo(
      523.64 * _xScaling,
      155.78 * _yScaling,
      876.61 * _xScaling,
      155.78 * _yScaling,
      876.61 * _xScaling,
      155.78 * _yScaling,
    );
    path.cubicTo(
      886.84 * _xScaling,
      155.04 * _yScaling,
      974.71 * _xScaling,
      149.99 * _yScaling,
      1034.66 * _xScaling,
      209.76 * _yScaling,
    );
    path.cubicTo(
      1075.94 * _xScaling,
      250.92 * _yScaling,
      1079.5400000000002 * _xScaling,
      298.45 * _yScaling,
      1080 * _xScaling,
      313.1 * _yScaling,
    );
    path.cubicTo(
      1080 * _xScaling,
      598.73 * _yScaling,
      1080 * _xScaling,
      884.37 * _yScaling,
      1080 * _xScaling,
      1170 * _yScaling,
    );
    path.cubicTo(
      1080 * _xScaling,
      1170 * _yScaling,
      0 * _xScaling,
      1170 * _yScaling,
      0 * _xScaling,
      1170 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      1170 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
