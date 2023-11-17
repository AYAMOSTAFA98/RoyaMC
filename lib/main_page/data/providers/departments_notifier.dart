import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/best_sellers_model.dart';
import '../models/departments_model.dart';

final StateNotifierProvider<DepartmentsNotifier, Object?> departmentsProvider =
    StateNotifierProvider(
  (ref) => DepartmentsNotifier(ref),
);

class DepartmentsNotifier extends StateNotifier<void> {
  DepartmentsNotifier(this.ref) : super(null);

  final ValueNotifier<List<Department>> departments = ValueNotifier([]);
  final ValueNotifier<List<Datum>> bestSellers = ValueNotifier([]);
  final Ref ref;
  DepartmentsModel? model;
  BestSellersModel? bestSellersModel;
  Future<List<Department>> getdepartments() async {
    Response response = await Dio().get(
      'https://royamedicalcenter.com/api/v1/departments',
    );
    if (response.statusCode == 200) {
      model = DepartmentsModel.fromJson(response.data);

      departments.value = model!.data;

      return model!.data;
    }
    return [];
  }
  Future<List<Datum>> getBestSellers() async {
    Response response = await Dio().get(
      'https://royamedicalcenter.com/api/v1/sellers',
    );
    if (response.statusCode == 200) {
      bestSellersModel = BestSellersModel.fromJson(response.data);

      bestSellers.value = bestSellersModel!.data;

      return bestSellersModel!.data;
    }
    return [];
  }
}
