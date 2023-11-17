import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roya_center/core/presentation/styles/sizes.dart';
import '../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../core/presentation/styles/app_images.dart';
import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/widgets/custom_button.dart';
import '../../../main_page.dart';

class AppointmentContainer extends ConsumerWidget {
  const AppointmentContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.marginH16),
      decoration: const BoxDecoration(
          color: AppStaticColors.lightBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(
              Sizes.textFieldR12,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.marginH24, vertical: Sizes.marginV8)
                .copyWith(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Early protection for\nyour family health',
                  style: FontStyles.appointmentFontStyle(context),
                ),
                const SizedBox(
                  height: Sizes.marginV8,
                ),
                CustomButton(
                  onPressed: () {
                    ref.read(bottomNavIndexProvider.state).state = 3;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MainPage(),
                      ),
                    );
                  },
                  text: 'Book Now',
                  height: Sizes.buttonHeight29,
                  width: Sizes.buttonWidth90,
                  buttonColor: AppStaticColors.mainGray,
                ),
              ],
            ),
          ),
          Image.asset(
              height: Sizes.imageH135,
              width: Sizes.imageW121,
              AppImages.appointmentImage2),
        ],
      ),
    );
  }
}
