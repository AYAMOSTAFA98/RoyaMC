import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roya_center/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../location/presentation/screens/map_screen.dart';
import '../../../prices/presentation/screens/web_view_screen.dart';

class HomeShellDrawer extends ConsumerWidget {
  const HomeShellDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void closeDrawer() {
      if (Scaffold.of(context).isDrawerOpen) {
        Scaffold.of(context).openEndDrawer();
      }
    }

    return SizedBox(
      width: Sizes.drawerWidth240,
      child: Drawer(
        elevation: 0,
        backgroundColor: AppStaticColors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.drawerPaddingV70,
            ),
            child: Column(
              children: [
                DrawerItem(
                  title: 'Location',
                  icon: Icons.location_on,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(
                           ),
                      ),
                    );
                    closeDrawer();
                  },
                ),
                DrawerItem(
                  title: 'Offers',
                  icon: Icons.percent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewScreen(
                            pageUrl:
                                'https://royamedicalcenter.com/morpheus-offer'),
                      ),
                    );
                    closeDrawer();
                  },
                ),
                DrawerItem(
                  title: 'Gallery',
                  icon: Icons.photo_library_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewScreen(
                            pageUrl:
                                'https://www.instagram.com/royamedicalcenter/'),
                      ),
                    );
                    closeDrawer();
                  },
                ),
                const SizedBox(height: Sizes.marginV16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: Sizes.icon25,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(title, style: FontStyles.drawerFontStyle(context)),
      onTap: onTap,
      dense: true,
      horizontalTitleGap: Sizes.marginH8,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Sizes.drawerPaddingH20,
        vertical: 5,
      ),
    );
  }
}
