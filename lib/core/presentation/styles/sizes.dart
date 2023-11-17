// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Sizes {
  static final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  static final double homeIndicatorHeight = MediaQueryData.fromWindow(window).viewPadding.bottom;

  //Font Size
  static const double font28 = 28;
  static const double font32 = 32;
  static const double font22 = 22;
  static const double font20 = 20;
  static const double font18 = 18;
  static const double font16 = 16;
  static const double font14 = 14;
  static const double font12 = 12;
  static const double font10 = 10;
  static const double font9 = 9;
  static const double font8 = 8;
  static const double font7 = 7;
  static const double font6 = 6;
  static const double font5 = 5;
  //Icon Size
  static const double icon72 = 72;
  static const double icon44 = 44;
  static const double icon30 = 30;
  static const double icon25 = 25;
  static const double icon18 = 18;
  static const double icon16 = 16;
  static const double icon12 = 12;
  static const double icon8 = 8;

  //Screen Margin
  static const double screenMarginV20 = 20;
  static const double screenMarginV16 = 16;
  static const double screenMarginV8 = 8;
  static const double screenMarginH36 = 36;
  static const double screenMarginH28 = 28;
  static const double screenMarginH20 = 20;
  //Widget Margin
  static const double marginV62 = 62;
  static const double marginV55 = 55;
  static const double marginV50 = 50;
  static const double marginV44 = 44;
  static const double marginV40 = 40;
  static const double marginV36 = 36;
  static const double marginV32 = 32;
  static const double marginV28 = 28;
  static const double marginV20 = 20;
  static const double marginV16 = 16;
  static const double marginV12 = 12;
  static const double marginV10 = 10;
  static const double marginV8 = 8;
  static const double marginV6 = 6;
  static const double marginV5 = 5;
  static const double marginV2 = 2;
  static const double marginH40 = 40;
  static const double marginH30 = 30;
  static const double marginH28 = 28;
  static const double marginH24 = 24;
  static const double marginH20 = 20;
  static const double marginH16 = 16;
  static const double marginH17 = 17;
  static const double marginH12 = 12;
  static const double marginH8 = 8;
  static const double marginH5 = 5;
  static const double marginH4 = 4;

  //Widget Padding
  static const double paddingV14 = 14;
  static const double paddingV12 = 12;
  static const double paddingV8 = 8;
  static const double paddingV4 = 4;
  static const double paddingH20 = 20;
  static const double paddingH14 = 14;
  static const double paddingH8 = 8;
  static const double paddingH3 = 3;

  //Widget Size
  static const double maxWidth600 = 600;
  static const double maxWidth360 = 360;
  static const double maxWidth254 = 254;
  static const double maxWidth261 = 261;
  static const double textWidth162 = 162;
  static const double appointmentcontainerH = 110;
  static const double appointmentRectanleH = 113;
  static const double departmentTitleH = 34;
  //Button
  static const double buttonHeight60 = 60;
  static const double buttonHeight58 = 58;
  static const double buttonHeight48 = 48;
  static const double buttonHeight44 = 44;
  static const double buttonHeight40 = 40;
  static const double buttonHeight32 = 32;
  static const double buttonHeight29 = 29;
  static const double buttonHeight27 = 27;
  static const double buttonWidth300 = 300;
  static const double buttonWidth240 = 240;
  static const double buttonWidth228 = 228;
  static const double buttonWidth180 = 180;
  static const double buttonWidth136 = 136;
  static const double buttonWidth128 = 128;
  static const double buttonWidth121 = 121;
  static const double buttonWidth90 = 90;
  static const double buttonWidth60 = 60;
  static const double buttonWidth58 = 58;
  static const double buttonWidth40 = 40;
  static const double buttonR25 = 25;

  //TextField
  static const double textFieldR12 = 12;
  static const double textFieldR25 = 25;
  static const double textFieldPaddingV18 = 18;
  static const double textFieldPaddingV14 = 14;
  static const double textFieldPaddingV10 = 10;
  static const double textFieldPaddingH42 = 42;
  static const double textFieldPaddingH38 = 38;
  static const double textFieldPaddingH14 = 14;
  static const double textFieldMarginV20 = 20;
  static const double textFieldPrefixWidth144 = 144;

  //Card
  static const double cardR200 = 200;
  static const double cardR20 = 20;
  static const double cardR14 = 14;
  static const double cardR10 = 10;
  static const double cardPaddingV16 = 16;
  static const double cardPaddingH20 = 20;

  //Dialog
  static const double dialogWidth280 = 280;
  static const double dialogR20 = 20;
  static const double dialogR6 = 4;
  static const double dialogPaddingV28 = 28;
  static const double dialogPaddingH20 = 20;
  static const double dialogPaddingH10 = 10;

  //Image
  static const double imageR140 = 140;
  static const double imageR100 = 100;
  static const double imageR64 = 64;
  static const double imageR56 = 56;
  static const double imageR28 = 28;
  static const double imageH250 = 250;
  static const double imageH180 = 180;
  static const double imageH135 = 135;
  static const double imageH132 = 132;
  static const double imageH110 = 110;
  static const double imageH100 = 100;
    static const double imageH97 = 97;
  static const double imageH90 = 90;
  static const double imageW121 = 121;
  //LoadingIndicator
  static const double loadingIndicatorR150 = 150;
  static const double loadingIndicatorR90 = 90;

  //AppBar
  static const double appBarHeight56 = 56;
  static const double appBarButtonR32 = 32;

  //Drawer
  static const double drawerWidth240 = 240;
  static const double drawerPaddingV70 = 70;
  static const double drawerPaddingH20 = 20;

  //BottomNavigationBar
  static const double bottomNavBarHeight79 = 79;
  static const double bottomNavBarIconR24 = 24;

  //Map
  static const double mapSearchBarHeight = 60;
  static const double mapSearchBarRadius = 8;
  static const double mapDirectionsInfoRadius = 20;
  static const double mapDirectionsInfoTop = 112;
  static const double mapFABRadius = 56;
  static const double mapFABBottom = 32;
  static const double mapFABRight = 28;
  static const double mapConfirmButtonBottom = 36;
  static const double mapConfirmButtonLeft = 36;
}
