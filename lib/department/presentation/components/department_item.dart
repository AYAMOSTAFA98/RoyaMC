import 'package:flutter/material.dart';
import '../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/custom_button.dart';
import '../../../prices/presentation/screens/web_view_screen.dart';

class DepartmentItem extends StatelessWidget {
  final String title, description, image;
  const DepartmentItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.marginH16),
      padding: const EdgeInsets.symmetric( horizontal: Sizes.marginH12,),
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
                vertical: Sizes.marginV10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: Sizes.marginV8,
                ),
                Text(
                  title,
                  style: FontStyles.departmentFontStyle(context),
                ),
                const SizedBox(
                  height: Sizes.marginV8,
                ),
                SizedBox(
                  width: Sizes.buttonWidth180,
                  child: Text(
                    description,
                    style: FontStyles.department2FontStyle(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: Sizes.marginV8,
                ),
                Align(
                  child: CustomButton(
                    onPressed: () {
                     // title.toLowerCase().replaceAll(' ', '-');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  WebViewScreen(
                              pageUrl:
                                  'https://royamedicalcenter.com/${title.toLowerCase().replaceAll(' ', '-')}'),
                        ),
                      );
                    },
                    text: 'Book Now',
                    height: Sizes.buttonHeight29,
                    width: Sizes.buttonWidth90,
                    buttonColor: AppStaticColors.mainGray,
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            height: Sizes.imageH100,
            width: Sizes.imageW121,
            image,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
