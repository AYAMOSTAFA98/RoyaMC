import 'package:flutter/material.dart';
import 'package:roya_center/core/presentation/styles/sizes.dart';
import 'package:roya_center/core/presentation/widgets/custom_text.dart';

class HomeDepartmentCard extends StatelessWidget {
  final String image, name;
  final String? rating;
  const HomeDepartmentCard(
      {super.key, required this.image, required this.name, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(bottom: Sizes.marginV6, left: Sizes.paddingH3),
      alignment: Alignment.bottomLeft,
      width: Sizes.buttonWidth121,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.cardR10),
          )),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rating != null
                ? Row(
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                        size: Sizes.icon18,
                      ),
                      CustomText.f12(
                        context,
                        rating!,
                        color: Colors.white,
                      ),
                    ],
                  )
                : const SizedBox(),
            Padding(
              padding: EdgeInsets.only(
                  left: Sizes.marginH4,
                  top: rating != null ? Sizes.marginV2 : 0),
              child: CustomText.f9(
                context,
                name,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ]),
    );
  }
}
