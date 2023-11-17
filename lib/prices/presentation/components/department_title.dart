import 'package:flutter/material.dart';

import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/styles/sizes.dart';

class DepartmentTitle extends StatelessWidget {
  final String departmentName;
  const DepartmentTitle({
    super.key,
    required this.departmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Container( alignment: Alignment.center,
      height: Sizes.departmentTitleH,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Text(departmentName,
          style: FontStyles.priceListTitleFontStyle(context)),
    );
  }
}
