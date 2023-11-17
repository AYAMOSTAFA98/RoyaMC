import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roya_center/core/presentation/styles/app_images.dart';
import '../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/custom_button.dart';
import '../../../core/presentation/widgets/custom_text.dart';
import '../../../core/presentation/widgets/empty_appbar_widget.dart';
import '../../../core/presentation/widgets/platform_widgets/custom_text_form_field.dart';
import '../../../main_page.dart';
import '../../../main_page/data/providers/contact_notifier.dart';

class AppointmentScreen extends ConsumerWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ContactNotifier contactNotifier = ref.read(contactProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const EmptyAppBar(
        statusBarColor: Color(0xFFFFFFFF),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.appointmentImage3,
                        fit: BoxFit.fitHeight,
                        height: Sizes.maxWidth261,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height -
                      (Sizes.maxWidth261 - Sizes.marginH30),
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.appointmentImage4),
                          fit: BoxFit.fitHeight)),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: Sizes.marginV55,
                      ),
                      CustomText.f16(
                        context,
                        'Contact US',
                        color: AppStaticColors.white,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: Sizes.marginV8,
                      ),
                      CustomText.f9(
                        context,
                        'To reach out to our Roya Medical Team, please fill in the below form.\nOur team members will revert back to you shortly.',
                        color: AppStaticColors.white,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: Sizes.marginV16,
                      ),
                      CustomTextFormField(
                        key: const ValueKey('login_name'),
                        hintText: 'Full name',
                        // validator: ValueValidators.validateEmail(context),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (v) {
                          contactNotifier.name = v;
                        },
                      ),
                      const SizedBox(
                        height: Sizes.marginV8,
                      ),
                      CustomTextFormField(
                        key: const ValueKey('login_email'),
                        hintText: 'Email',
                        // controller: emailController,
                        // validator: ValueValidators.validateEmail(context),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (v) {
                          contactNotifier.email = v;
                        },
                      ),
                      const SizedBox(
                        height: Sizes.marginV8,
                      ),
                      CustomTextFormField(
                        key: const ValueKey('login_phone'),
                        hintText: 'Phone Number',
                        // controller: emailController,
                        // validator: ValueValidators.validateEmail(context),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (v) {
                          contactNotifier.phone = v;
                        },
                      ),
                      const SizedBox(
                        height: Sizes.marginV8,
                      ),
                      CustomTextFormField(
                        key: const ValueKey('login_department'),
                        hintText: 'Select Department',
                        // controller: emailController,
                        // validator: ValueValidators.validateEmail(context),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (v) {
                          contactNotifier.subject = v;
                        },
                      ),
                      const SizedBox(
                        height: Sizes.marginV8,
                      ),
                      CustomTextFormField(
                        key: const ValueKey('login_email'),
                        hintText: 'Message',
                        // controller: emailController,
                        // validator: ValueValidators.validateEmail(context),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (v) {
                          contactNotifier.message = v;
                        },
                      ),
                      const SizedBox(
                        height: Sizes.marginV28,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.marginH40),
                        child: CustomButton(
                          onPressed: () async{
                           await contactNotifier.postContact();
                            ref.read(bottomNavIndexProvider.state).state = 0;
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainPage(),
                              ),
                            );
                          },
                          height: Sizes.buttonHeight32,
                          width: Sizes.buttonWidth90,
                          buttonColor: AppStaticColors.selectedIconColor,
                          child: CustomText.f16(
                            context,
                            'Submit',
                            color: const Color(0xffFFFFFF),
                            weight: FontStyles.fontWeightSemiBold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.marginV16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
