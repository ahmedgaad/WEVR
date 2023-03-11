import 'package:dio/dio.dart';
import 'package:wevr_app/core/errors/exceptions.dart';
import 'package:wevr_app/features/map_based_homes/data/models/places_model.dart';

import '../../../../core/utils/constants_manager.dart';

abstract class PlacesRemoteDataSource {
  Future<PlacesSuggestionModel> getPlacesSuggestions({
    required String place,
    required String sessionToken,
  });
}

class PlacesRemoteDataSourceImpl implements PlacesRemoteDataSource {
  final Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(
        seconds: 20 * 1000,
      ),
      sendTimeout: const Duration(
        seconds: 20 * 1000,
      ),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  @override
  Future<PlacesSuggestionModel> getPlacesSuggestions({
    required String place,
    required String sessionToken,
  }) async {
    try {
      Response response = await dio.get(
        ConstantsManager.suggestionsBaseURL,
        queryParameters: {
          'key': ConstantsManager.googleAPIKey,
          'input': place,
          'types': 'address',
          'sessiontoken': sessionToken,
          'components': 'country:eg',
        },
      );
      print(response.data['predictions']);
      print(response.statusCode);
      return response.data['predictions'];
    } on DioError catch (error) {
      print(error.toString());
      throw ServerException();
    }
  }
}
