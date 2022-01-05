import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/core/constants.dart' as constants;

class MaxWidthPadding extends EdgeInsets {
  const MaxWidthPadding._({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) : super.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );

  factory MaxWidthPadding.responsive({
    required context,
    double top = 0,
    double bottom = 0,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    var horizontalPadding = (screenWidth - constants.maxWidth) / 2;

    if (screenWidth < constants.maxWidth) {
      horizontalPadding = 0;
    }

    return MaxWidthPadding._(
      left: horizontalPadding,
      top: top,
      right: horizontalPadding,
      bottom: bottom,
    );
  }
}
