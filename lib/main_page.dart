import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roya_center/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:roya_center/core/presentation/styles/app_images.dart';
import 'package:roya_center/core/presentation/styles/sizes.dart';
import 'package:roya_center/prices/presentation/screens/Prices_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'appointment/presentation/screens/appointment_screen.dart';
import 'department/presentation/screens/department_screen.dart';
import 'home/presentation/screens/home_screen.dart';

final StateProvider<int> bottomNavIndexProvider =
    StateProvider<int>(((ref) => 0));

class MainPage extends ConsumerWidget {
  final int? indx;
  const MainPage({
    Key? key,
    this.indx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> widgets = [
      const HomeScreen(),
      const PricesScreen(),
      const DepartmentScreen(),
      const AppointmentScreen(),
    ];
    int bottomNavIndex = ref.watch(bottomNavIndexProvider);
    return Scaffold(
      backgroundColor: AppStaticColors.white,
      extendBodyBehindAppBar: true,
      // onWillPop: () async {
      //   return await Dialogs.showCustomDialog(
      //       okFun: () => SystemNavigator.pop(),
      //       context: context,
      //       msg: 'Are You Sure ?');
      // },
      body: widgets[bottomNavIndex],
      bottomNavigationBar: PlatformNavBar(
        backgroundColor: AppStaticColors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.bottomNavImage1,
                colorFilter: const ColorFilter.mode(
                    AppStaticColors.greyShadow, BlendMode.dst),
                height: 24,
                width: 24),
            label: 'Home',
            activeIcon: SvgPicture.asset(AppImages.bottomNavImage1,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcATop),
                height: 24,
                width: 24),
            backgroundColor: AppStaticColors.white,
          ),
          BottomNavigationBarItem(
            backgroundColor: AppStaticColors.white,
            icon: SvgPicture.asset(AppImages.bottomNavImage2,
                colorFilter: const ColorFilter.mode(
                    AppStaticColors.greyShadow, BlendMode.dst),
                height: 24,
                width: 24),
            activeIcon: SvgPicture.asset(AppImages.bottomNavImage2,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcATop),
                height: 24,
                width: 24),
            label: 'Prices',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppStaticColors.white,
            icon: SvgPicture.asset(AppImages.bottomNavImage3,
                colorFilter: const ColorFilter.mode(
                    AppStaticColors.greyShadow, BlendMode.dst),
                height: 24,
                width: 24),
            activeIcon: SvgPicture.asset(AppImages.bottomNavImage3,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcATop),
                height: 24,
                width: 24),
            label: 'Departments',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppStaticColors.white,
            icon: SvgPicture.asset(AppImages.bottomNavImage4,
                colorFilter: const ColorFilter.mode(
                    AppStaticColors.greyShadow, BlendMode.dst),
                // color: AppStaticColors.greyShadow,
                height: 24,
                width: 24),
            activeIcon: SvgPicture.asset(AppImages.bottomNavImage4,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcATop),
                //color: Theme.of(context).primaryColor,
                height: 24,
                width: 24),
            label: 'Book',
          )
        ],
        itemChanged: (v) {
          ref.read(bottomNavIndexProvider.notifier).state = v;
        },
        currentIndex: indx ?? bottomNavIndex,
        material3: (_, __) {
          return MaterialNavigationBarData(
            backgroundColor: AppStaticColors.white,
            surfaceTintColor: AppStaticColors.white,
            indicatorColor: AppStaticColors.white,
            height: Sizes.bottomNavBarHeight79,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            elevation: 2,
          );
        },
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.call,
        activeIcon: Icons.close,
        backgroundColor: Theme.of(context).primaryColor,
        spacing: 10,
        spaceBetweenChildren: 5,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                AppImages.contactImage1,
              ),
              shape: const StadiumBorder(),
              label: 'WhatsApp message',
              onTap: () {
                sendWhatsApp();
              },
              elevation: 0),
          SpeedDialChild(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                AppImages.contactImage2,
              ),
              shape: const StadiumBorder(),
              label: 'Phone call',
              onTap: () {
                phoneCall();
              },
              elevation: 0),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

void sendWhatsApp() {
  String url = 'whatsapp.com/send?phone=+971544426622';
  launchUrl(Uri.parse(url));
}

void phoneCall() {
  String url = 'tel://+971544426622';
  launchUrl(Uri.parse(url));
}
