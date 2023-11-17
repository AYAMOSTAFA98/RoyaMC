import 'package:flutter/material.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../main_page/data/models/price_list_model.dart';
import '../components/department_price_item.dart';

class PriceListContainer extends StatelessWidget {
  final List<PriceList> list;
  const PriceListContainer({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dialogPaddingH10),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, i) {
        return DepartmentPriceItem(
          image: list[i].photoFile,
          name: list[i].title,
          price: list[i].price
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: Sizes.dialogPaddingH10,
          
          childAspectRatio: 0.9),
    );
  }
}
