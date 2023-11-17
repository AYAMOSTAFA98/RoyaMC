// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roya_center/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:roya_center/core/presentation/styles/app_images.dart';

import '../../core/presentation/styles/sizes.dart';


enum TabItem {
  home,
  units,
  measurement,
  profile;
}

extension TabItemExtension on TabItem {
  Widget getTabItemIcon(BuildContext context) {
    switch (this) {
      case TabItem.home:
        return _getSvgIcon(
          context,
          AppImages.bottomNavImage1,
          color: AppStaticColors.shadowColor,
        );
      case TabItem.units:
        return _getSvgIcon(context, AppImages.bottomNavImage2);
      case TabItem.measurement:
        return _getSvgIcon(context, AppImages.bottomNavImage3);
      case TabItem.profile:
        return _getSvgIcon(context, AppImages.bottomNavImage4);
    }
  }

  Widget getTabItemSelectedIcon(BuildContext context) {
    switch (this) {
      case TabItem.home:
        return _getSvgIcon(
          context,
          AppImages.bottomNavImage1,
          isSelected: true,
        );
      case TabItem.units:
        return _getSvgIcon(
          context,
          AppImages.bottomNavImage2,
          isSelected: true,
        );
      case TabItem.measurement:
        return _getSvgIcon(
          context,
          AppImages.bottomNavImage3,
          isSelected: true,
        );
      
      case TabItem.profile:
        return _getSvgIcon(
          context,
          AppImages.bottomNavImage4,
          isSelected: true,
        );
    }
  }

  Widget _getSvgIcon(
    BuildContext context,
    String path, {
    Color? color,
    bool isSelected = false,
  }) {
    return SvgPicture.asset(
      path,
      color: color ?? (isSelected ? Theme.of(context).colorScheme.primary : null),
      height: Sizes.bottomNavBarIconR24,
      width: Sizes.bottomNavBarIconR24,
      fit: BoxFit.scaleDown,
    );
  }

  String getTabItemLabel(BuildContext context) {
    switch (this) {
      case TabItem.home:
        return 'Home';
      case TabItem.units:
        return 'Home';
      case TabItem.measurement:
        return 'Home';
      case TabItem.profile:
        return 'Home';
    }
  }
}
