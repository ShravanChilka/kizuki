import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/gradient_border/gradient_border.dart';

part 'logo_widget.dart';
part 'social_login_button.dart';
part 'skip_button.dart';

const _glassGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0x2AFFFFFF),
    Color(0x8AFFFFFF),
    Color(0x2AFFFFFF),
  ],
);

const _linearGradient = LinearGradient(
  transform: GradientRotation(147 * pi / 180),
  begin: Alignment.bottomRight,
  end: Alignment.topRight,
  colors: [
    Color(0xBF434343),
    Color(0x00434343),
  ],
);
