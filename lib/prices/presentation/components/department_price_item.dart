import 'package:flutter/material.dart';
import 'package:roya_center/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/styles/sizes.dart';

class DepartmentPriceItem extends StatelessWidget {
  final String image, name, price;
  const DepartmentPriceItem(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Sizes.imageH90,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.fill),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Sizes.cardR14))),
        ),
        const SizedBox(
          height: Sizes.marginV6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.marginH4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: FontStyles.priceListFontStyle(context)
                          .copyWith(color: AppStaticColors.black)),
                  Text(
                    price,
                    style: FontStyles.priceListFontStyle(context).copyWith(fontSize: Sizes.font6),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Sizes.marginV5,
            ),
            InkWell(
                onTap: () {},
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: Sizes.font8,
                    color: Theme.of(context).primaryColor,
                    fontFamily: FontStyles.interFontFamily(context),
                    fontWeight: FontStyles.fontWeightSemiBold,
                  ),
                  //textAlign: TextAlign.end,
                )),
          ],
        )
      ],
    );
  }
}
