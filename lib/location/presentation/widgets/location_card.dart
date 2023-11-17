import 'package:flutter/material.dart';
import 'package:roya_center/core/presentation/styles/sizes.dart';
import 'package:roya_center/core/presentation/widgets/custom_text.dart';

import '../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';

class LocationCard extends StatelessWidget {
  final String image, name, time, rating;
  final bool? isSelected;

  const LocationCard({
    super.key,
    required this.image,
    required this.name,
    required this.time,
    required this.rating,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 0.5,
      color: isSelected == true
          ? Theme.of(context).primaryColor
          : AppStaticColors.white,
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.marginH8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          Sizes.marginH8,
        ),
        child: Row(
          children: [
            Image.asset(image,
                height: Sizes.imageH97,
                width: Sizes.imageW121,
                fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.dialogPaddingH10,
                  vertical: Sizes.paddingV4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.f12(
                    context,
                    name,
                    color: isSelected == true
                        ? AppStaticColors.white
                        : AppStaticColors.black,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                        size: Sizes.icon18,
                      ),
                      CustomText.f12(
                        context,
                        rating,
                        color: isSelected == true
                            ? AppStaticColors.white
                            : AppStaticColors.black,
                      ),
                    ],
                  ),
                  CustomText.f12(
                    context,
                    time,
                    color: isSelected == true
                        ? AppStaticColors.white
                        : AppStaticColors.black,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
