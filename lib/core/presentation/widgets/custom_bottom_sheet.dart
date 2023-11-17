import 'package:flutter/material.dart';
import '../../core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../styles/sizes.dart';
import 'custom_button.dart';
import 'custom_text.dart';

abstract class CustomBottomSheet {
  static Future<String?> showCustomBottomSheet<String>(
    BuildContext context,
  ) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(
            right: Sizes.marginH17,
            left: Sizes.marginH24,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: Sizes.marginV8,
              ),
              CustomText.f20(
                context,
                'FILTER',
                color: AppStaticColors.blue,
                weight: FontWeight.normal,
              ),
              const SizedBox(
                height: Sizes.marginV32,
              ),
             // const DrawerColorsItem(),
              const SizedBox(
                height: Sizes.marginV20,
              ),
              // DrawerDateItem(
              //     onTap: () => showDatePicker(
              //       context: context,
              //       initialDate: DateTime.now(),
              //       firstDate: DateTime.now(),
              //       lastDate: DateTime(2030),
              //     ),
              //     timeofDay: '23 - September - 2017',
              //     title: 'Date',
              //   ),
                const SizedBox(
                height: Sizes.marginV20,
              ),
              CustomButton(
                onPressed: () {},
                // ref.isLoading(addItemStateProvider(add: true))
                //     ? null
                //     : addItem,
                text: 'Done',
                //width: Sizes.buttonWidth136,
              ),
            ],
          ),
        );
      },
    );
  }
}
