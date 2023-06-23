import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:wevr_app/features/user_dashboard/data/models/auction/auction_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class BaseAuctionRemoteDatasource {
  Future<List<AuctionModel>> getAuctions();
}

class AuctionRemoteDatasourceImpl implements BaseAuctionRemoteDatasource {
  final Dio dio = Dio(
    BaseOptions(
      headers: {"Content-Type": "application/json"},
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 20 * 10000),
      sendTimeout: const Duration(seconds: 20 * 10000),
      baseUrl: Constants.baseURL,
    ),
  );

  
  @override
  Future<List<AuctionModel>> getAuctions() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${Constants.userToken}',
      };
      final response = await dio.get(
        Constants.auction,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final auctions = List<AuctionModel>.from((response.data['data'] as List).map((auction) => AuctionModel.fromJson(auction)));
        log(auctions.toString(), name: 'auction');
        return auctions;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw Exception('Failed to load apartments: $e');
    }
  }
}