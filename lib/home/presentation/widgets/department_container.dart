import 'package:flutter/material.dart';
import 'package:roya_center/main_page/data/models/best_sellers_model.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/custom_text.dart';
import '../../../main_page/data/models/departments_model.dart';
import '../components/home_department_card.dart';

class DepartmentContainer extends StatelessWidget {
  final String title;
  final List<Department>? list;
  final List<Datum>? sellerslist;
  const DepartmentContainer(
      {super.key, required this.title,  this.list, this.sellerslist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Sizes.marginH16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Sizes.marginH8),
            child: CustomText.f10(context, title),
          ),
          SizedBox(
            height: Sizes.imageH132,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: list!=null?list!.length:sellerslist!.length,
              itemBuilder: (context, i) {
                return  HomeDepartmentCard(
                  name:list!=null? list![i].title : sellerslist![i].title,
                  image: list!=null? list![i].photo: sellerslist![i].photoFile,
                );
    
              },
              separatorBuilder: (context, index) {
                        return const SizedBox(
                          width:Sizes.marginH12 ,
                          //height: Sizes.marginV20,
                        );
                      },
            ),
          )
        ],
      ),
    );
  }
}
