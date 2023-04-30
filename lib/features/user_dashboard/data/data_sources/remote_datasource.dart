import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/user_dashboard/data/models/banner_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants_manager.dart';
import '../models/product_model.dart';

abstract class HomeDataSource {
  Future<List<ProductModel>> getProduct();
  Future<List<BannerModel>> getBanner();
}

class HomeDataSourceImpl implements HomeDataSource {
  final Dio dio = Dio(BaseOptions(
    headers: {"Content-Type": "application/json"},
    receiveDataWhenStatusError: true,
    receiveTimeout: const Duration(
      seconds: 20 * 1000,
    ),
    sendTimeout: const Duration(
      seconds: 20 * 1000,
    ),
    baseUrl: ConstantsManager.baseURL,
  ));

  @override
  Future<List<ProductModel>> getProduct() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${ConstantsManager.userToken!}',
      };
      final response = await dio.get(
        ConstantsManager.apartment,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.data) as List;
        final List<ProductModel> productModels = decodedJson.map<ProductModel>(
                (jsonProductModel) => ProductModel.fromJson(jsonProductModel))
            .toList();

        return productModels;
      } else {
        throw ServerException();
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<BannerModel>> getBanner() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${ConstantsManager.userToken!}',
      };
      final response = await dio.get(
        ConstantsManager.banners,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.data) as List;
        final List<BannerModel> BannerModels = decodedJson.map<BannerModel>(
                (jsonBannerModel) => BannerModel.fromJson(jsonBannerModel))
            .toList();
        return BannerModels;
      } else {
        throw ServerException();
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }
}
