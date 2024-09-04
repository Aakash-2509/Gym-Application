// constants_fonts.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metafit/contants/const_colors.dart';

class AppFonts {
  static final TextStyle headlineLarge = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 14.sp,
  );

  static final TextStyle headlineMedium = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: ConstColors.blackColor,
    fontSize: 12.sp,
  );

  static final TextStyle headlineSmall = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: ConstColors.blackColor,
    fontSize: 10.sp,
  );

  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 14.sp,
  );

  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 12.sp,
  );

  static final TextStyle bodySmall = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 16.sp,
  );

  static final TextStyle titleLarge = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 18.sp,
  );

  static final TextStyle titleMedium = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 12.sp,
  );

  static final TextStyle titleSmall = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    color: ConstColors.blackColor,
    fontSize: 14.sp,
  );

  static final TextStyle displayLarge = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 14.sp,
  );

  static final TextStyle displayMedium = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ConstColors.blackColor,
    fontSize: 12.sp,
    decoration: TextDecoration.underline,
    decorationColor: ConstColors.blackColor,
  );

  static final TextStyle displaySmall = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: ConstColors.blackColor,
  );
}
