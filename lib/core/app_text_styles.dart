import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.shareTechMono(
    color: AppColors.white,
    fontSize: 55,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle visor = GoogleFonts.shareTechMono(
    color: AppColors.white,
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
}
