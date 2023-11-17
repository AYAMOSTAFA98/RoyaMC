import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roya_center/main_page/data/models/departments_model.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/empty_appbar_widget.dart';
import '../../../main_page/data/providers/departments_notifier.dart';
import '../components/department_item.dart';

class DepartmentScreen extends ConsumerWidget {
  const DepartmentScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final DepartmentsNotifier departmentsNotifier =
        ref.read(departmentsProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const EmptyAppBar(
        statusBarColor: Color(0xFFFFFFFF),
      ),
      body: FutureBuilder(
        future: departmentsNotifier.getdepartments(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Department>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.only(top: Sizes.marginV28),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return DepartmentItem(
                      title: snapshot.data![i].title,
                      description: snapshot.data![i].rightDetails,
                      image: snapshot.data![i].photo,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: Sizes.marginV12,
                      //height: Sizes.marginV20,
                    );
                  },
                  itemCount: snapshot.data!.length),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          }
        },
      ),
    );
  }
}
