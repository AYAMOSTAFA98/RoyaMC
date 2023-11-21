import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../core/presentation/styles/app_images.dart';
import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/styles/sizes.dart';

class WelcomeItem extends StatelessWidget {
  const WelcomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.marginH16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to',
                      style: FontStyles.welcomeFontStyle(context)
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: Sizes.marginH5,
                    ),
                    Text(
                      'Roya Medical Center',
                      style: FontStyles.welcomeFontStyle(context),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(
                      AppImages.drawerImage,
                      color: Theme.of(context).primaryColor,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.marginH20,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: AppStaticColors.lightGrey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      Sizes.textFieldR25,
                    ),
                  ),
                  border: Border.all(color: AppStaticColors.lightBlue)),
              child: TextFormField(
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (v) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Image.asset(
                    AppImages.searchImage,
                    //color: Colors.black.withOpacity(0.6),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
                  hintText: "Search ...",
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: AppStaticColors.greyShadow,
                      fontWeight: FontWeight.normal),
                ),
                onChanged: (v) async {},
              ),
            )
          ]),
    );
  }
}
