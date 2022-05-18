import 'package:flutter/material.dart';

class NoInternetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 400;
    final double _yScaling = size.height / 600;
    path.lineTo(0.57283 * _xScaling, 602.39496 * _yScaling);
    path.cubicTo(
      0.57283 * _xScaling,
      602.39496 * _yScaling,
      127.66125 * _xScaling,
      601.02874 * _yScaling,
      126.20045999999999 * _xScaling,
      599.6625399999999 * _yScaling,
    );
    path.cubicTo(
      127.66125 * _xScaling,
      601.02875 * _yScaling,
      323.40662999999995 * _xScaling,
      572.3383099999999 * _yScaling,
      231.37707999999998 * _xScaling,
      340.0823299999999 * _yScaling,
    );
    path.cubicTo(
      139.34752999999998 * _xScaling,
      107.8263499999999 * _yScaling,
      386.22043999999994 * _xScaling,
      -0.10436000000009926 * _yScaling,
      384.75965999999994 * _xScaling,
      -1.470570000000123 * _yScaling,
    );
    path.cubicTo(
      386.2204499999999 * _xScaling,
      -0.10435000000012296 * _yScaling,
      -2.3487500000000523 * _xScaling,
      -0.10435000000012296 * _yScaling,
      -3.809530000000052 * _xScaling,
      -1.470570000000123 * _yScaling,
    );
    path.cubicTo(
      -2.348740000000052 * _xScaling,
      -0.10435000000012296 * _yScaling,
      0.5728299999999482 * _xScaling,
      602.3949599999999 * _yScaling,
      0.5728299999999482 * _xScaling,
      602.3949599999999 * _yScaling,
    );
    path.cubicTo(
      0.5728299999999482 * _xScaling,
      602.3949599999999 * _yScaling,
      0.57283 * _xScaling,
      602.39496 * _yScaling,
      0.57283 * _xScaling,
      602.39496 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
