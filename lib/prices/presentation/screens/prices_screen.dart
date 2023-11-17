import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roya_center/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:roya_center/core/presentation/styles/font_styles.dart';
import 'package:roya_center/main_page/data/models/price_list_model.dart';
import 'package:roya_center/main_page/data/providers/price_list_notifier.dart';
import 'package:roya_center/prices/presentation/screens/web_view_screen.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/empty_appbar_widget.dart';
import '../components/department_title.dart';
import '../widgets/prices_list_container.dart';

class PricesScreen extends ConsumerWidget {
  const PricesScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final PriceListNotifier departmentsNotifier =
        ref.read(priceListProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const EmptyAppBar(
        statusBarColor: Colors.transparent,
      ),
      body: FutureBuilder(
          future: departmentsNotifier.getPriceList(),
          builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return SafeArea(
                  child: ListView.builder(
                shrinkWrap: true,
                primary: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      DepartmentTitle(departmentName: snapshot.data![i].title),
                      Padding(
                        padding: const EdgeInsets.all(Sizes.dialogPaddingH10),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WebViewScreen(
                                      pageUrl:
                                          'https://royamedicalcenter.com/price-list'),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('See More',
                                    style:
                                        FontStyles.seeMoreFontStyle(context)),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: AppStaticColors.blue,
                                  size: 16,
                                )
                              ],
                            )),
                      ),
                      PriceListContainer(
                        list: snapshot.data![i].priceLists,
                      ),
                      const SizedBox(
                        height: Sizes.marginV16,
                      )
                    ],
                  );
                },
              ));
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ));
            }
          }),
    );
  }
}
