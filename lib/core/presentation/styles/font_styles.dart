import 'package:flutter/material.dart';
import '../../core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'sizes.dart';

class FontStyles {
  static String fontFamily(BuildContext context) => 'font Family';
  static String gabrielaFontFamily(BuildContext context) => 'Gabriela';
  static String interFontFamily(BuildContext context) => 'Inter';

  static const fontWeightBlack = FontWeight.w900;
  static const fontWeightExtraBold = FontWeight.w800;
  static const fontWeightBold = FontWeight.w700;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightNormal = FontWeight.w400;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightThin = FontWeight.w100;

  static TextStyle welcomeFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font22,
        color: Theme.of(context).primaryColor,
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightSemiBold,
      );
  static TextStyle welcome1FontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font10,
        color: Theme.of(context).textTheme.titleMedium!.color,
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightNormal,
      );
  static TextStyle appointmentFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font18,
        color: const Color(0xff101623),
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightSemiBold,
      );
  static TextStyle onboardingFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font22,
        color: AppStaticColors.black,
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightBold,
      );
  static TextStyle departmentFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font12,
        color: AppStaticColors.selectedIconColor,
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightSemiBold,
      );
  static TextStyle department2FontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font12,
        color: AppStaticColors.black,
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightBold,
      );
  static TextStyle priceListFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font7,
        color: Theme.of(context).primaryColor,
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightSemiBold,
      );
  static TextStyle priceListTitleFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font12,
        color: AppStaticColors.shadowwhite,
        fontFamily: interFontFamily(context),
        fontWeight: fontWeightSemiBold,
      );
  static TextStyle seeMoreFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font16,
        color: AppStaticColors.blue,
        fontFamily: gabrielaFontFamily(context),
        fontWeight: fontWeightNormal,
      );
  static TextStyle drawerFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font18,
        color: AppStaticColors.black,
        fontFamily: gabrielaFontFamily(context),
        fontWeight: fontWeightNormal,
      );
}
