import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class ThreePeakWavesClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var waveHeight = size.height / 5;
    var waveWidth = size.width / 5;

    path.lineTo(
        0, size.height - waveHeight); // Move to the first wave's starting point

    for (int i = 0; i < 5; i++) {
      path.quadraticBezierTo(
        waveWidth / 2 + waveWidth * i, // Control point's x-coordinate
        i % 2 == 0
            ? size.height
            : size.height - waveHeight * 2, // Control point's y-coordinate
        waveWidth * (i + 1), // End point's x-coordinate
        size.height - waveHeight, // End point's y-coordinate
      );
    }

    path.lineTo(size.width, 0); // Move to the top right
    path.lineTo(0, 0); // Move to the top left

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

svgIcon(String path) =>
    SvgPicture.asset(path, width: 20.0, height: 20.0, color: primaryColor);
svgIcon2(String path) =>
    SvgPicture.asset(path, width: 50.0, height: 50.0, color: Colors.white);
