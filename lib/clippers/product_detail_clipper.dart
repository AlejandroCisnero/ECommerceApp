import 'package:flutter/material.dart';

class ProductDetailClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 400;
    final double _yScaling = size.height / 600;
    path.lineTo(-1.89778 * _xScaling, 229 * _yScaling);
    path.cubicTo(
      1.3321800000000001 * _xScaling,
      241 * _yScaling,
      -1.89778 * _xScaling,
      283 * _yScaling,
      105.76742 * _xScaling,
      286 * _yScaling,
    );
    path.cubicTo(
      213.43262 * _xScaling,
      289 * _yScaling,
      314.6379 * _xScaling,
      287 * _yScaling,
      314.6379 * _xScaling,
      287 * _yScaling,
    );
    path.cubicTo(
      314.6379 * _xScaling,
      287 * _yScaling,
      400.77006 * _xScaling,
      279 * _yScaling,
      401.84671000000003 * _xScaling,
      352 * _yScaling,
    );
    path.cubicTo(
      402.92336 * _xScaling,
      425 * _yScaling,
      404.00001000000003 * _xScaling,
      599 * _yScaling,
      404.00001000000003 * _xScaling,
      599 * _yScaling,
    );
    path.cubicTo(
      404.00001000000003 * _xScaling,
      599 * _yScaling,
      -1.8977799999999547 * _xScaling,
      599 * _yScaling,
      -1.8977799999999547 * _xScaling,
      599 * _yScaling,
    );
    path.cubicTo(
      -1.8977799999999547 * _xScaling,
      599 * _yScaling,
      -5.127739999999955 * _xScaling,
      217 * _yScaling,
      -1.8977799999999547 * _xScaling,
      229 * _yScaling,
    );
    path.cubicTo(
      -1.8977799999999547 * _xScaling,
      229 * _yScaling,
      -1.89778 * _xScaling,
      229 * _yScaling,
      -1.89778 * _xScaling,
      229 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
