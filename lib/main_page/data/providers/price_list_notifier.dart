import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/price_list_model.dart';

final StateNotifierProvider<PriceListNotifier, Object?> priceListProvider =
    StateNotifierProvider(
  (ref) => PriceListNotifier(ref),
);

class PriceListNotifier extends StateNotifier<void> {
  PriceListNotifier(this.ref) : super(null);

  final ValueNotifier<List<Datum>> priceLists = ValueNotifier([]);

  final Ref ref;
  PriceListModel? model;
  Future<List<Datum>> getPriceList() async {
    Response response = await Dio().get(
      'https://royamedicalcenter.com/api/v1/categories',
    );
    if (response.statusCode == 200) {
      model = PriceListModel.fromJson(response.data);

      priceLists.value = model!.data;

      return model!.data;
    }
    return [];
  }
}
