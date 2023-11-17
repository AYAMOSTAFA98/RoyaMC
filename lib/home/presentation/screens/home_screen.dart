import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roya_center/main_page/data/models/best_sellers_model.dart';
import '../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/empty_appbar_widget.dart';
import '../../../main_page/data/models/departments_model.dart';
import '../../../main_page/data/providers/departments_notifier.dart';
import '../widgets/appointment_container.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/department_container.dart';
import '../widgets/welcome_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final DepartmentsNotifier departmentsNotifier =
        ref.read(departmentsProvider.notifier);

    return Scaffold(
      drawer: const HomeShellDrawer(),
      backgroundColor: AppStaticColors.white,
      resizeToAvoidBottomInset: true,
      appBar: const EmptyAppBar(
        statusBarColor: Color(0xFFFFFFFF),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: Sizes.marginH17,
            ),
            const WelcomeItem(),
            const SizedBox(
              height: Sizes.marginH17,
            ),
            //padding: const EdgeInsets.only(bottom: Sizes.marginH8),
            FutureBuilder(
                initialData: departmentsNotifier.departments.value,
                future: departmentsNotifier.getdepartments(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Department>> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return DepartmentContainer(
                      title: 'OUR DEPARTMENTS',
                      list: departmentsNotifier.departments.value,
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.marginV16),
              child: AppointmentContainer(),
            ),
            FutureBuilder(
                future: departmentsNotifier.getBestSellers(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Datum>> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return DepartmentContainer(
                      title: 'BET SELLERS',
                      sellerslist: snapshot.data!,
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
