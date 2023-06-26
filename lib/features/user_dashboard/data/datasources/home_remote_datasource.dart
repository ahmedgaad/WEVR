import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wevr_app/features/user_dashboard/data/models/search_filter_model.dart';
import 'package:wevr_app/features/user_dashboard/data/models/search_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../models/apartment_model.dart';
import '../models/save_apartment_model.dart';
import '../models/saved_aparments_model.dart';

abstract class HomeRemoteDataSource {
  Future<ApartmentModel> getApartments();

  Future<SaveApartmentModel> saveApartment({required int id});

  Future<SavedApartmentsModel> getSavedApartments();

  Future<List<SearchModel>> searchApartments({required String query});

  Future<dynamic> bookVisit({
    required int id,
    required DateTime dateTime,
  });

  Future<List<SearchFilterModel>> searchFilter(
    int? type,
    int? minPrice,
    int? bedroom,
    int? baths,
    int? livingRoom,
    int? maxPrice,
  );
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio = Dio(BaseOptions(
    headers: {"Content-Type": "application/json"},
    receiveDataWhenStatusError: true,
    followRedirects: false,
    maxRedirects: 0,
    receiveTimeout: const Duration(
      seconds: 20 * 1000,
    ),
    sendTimeout: const Duration(
      seconds: 20 * 1000,
    ),
    baseUrl: Constants.baseURL,
  ));

  @override
  Future<ApartmentModel> getApartments() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${Constants.userToken}',
      };
      final response = await dio.get(
        Constants.apartment,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final ApartmentModel apartments =
            ApartmentModel.fromJson(response.data);
        return apartments;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw Exception('Failed to load apartments: $e');
    }
  }

  @override
  Future<SavedApartmentsModel> getSavedApartments() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${Constants.userToken!}',
      };
      final response = await dio.get(
        Constants.savedApartment,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final SavedApartmentsModel apartments =
            SavedApartmentsModel.fromJson(response.data);
        return apartments;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw Exception('Failed to load apartments: $e');
    }
  }

  @override
  Future<SaveApartmentModel> saveApartment({required int id}) async {
    try {
      final headers = {
        'Authorization': 'Bearer ${Constants.userToken!}',
      };
      final response = await dio.post(
        '${Constants.saveApartment}$id',
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final saveApartment = SaveApartmentModel.fromJson(response.data);
        return saveApartment;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw Exception('Failed to load apartments: $e');
    }
  }

  @override
  Future<List<SearchModel>> searchApartments({required String query}) async {
    try {
      final headers = {
        'Authorization': 'Bearer ${Constants.userToken}',
      };
      final response = await dio.get(
        Constants.search,
        queryParameters: {'query': query},
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final List<SearchModel> results = (response.data['data'] as List)
            .map((apartmentJson) => SearchModel.fromJson(apartmentJson))
            .toList();
        return results;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw Exception('Failed to load apartments: $e');
    }
  }

  @override
  Future<List<SearchFilterModel>> searchFilter(int? type, int? minPrice,
      int? bedroom, int? baths, int? livingRoom, int? maxPrice) async {
    try {
      final headers = {
        'Authorization': 'Bearer ${Constants.userToken}',
      };
      final params = {
        'type': type,
        'min_price': minPrice,
        'bedroom': bedroom,
        'baths': baths,
        'Livingroom': livingRoom,
        'max_price': maxPrice,
      };
      final response = await dio.get(
        Constants.search,
        queryParameters: params,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<SearchFilterModel> results = data
            .map((apartmentJson) => SearchFilterModel.fromJson(apartmentJson))
            .toList();
        return results;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw Exception('Failed to load apartments: $e');
    }
    throw UnimplementedError();
  }

  @override
  Future<Response> bookVisit({
    required int id,
    required DateTime dateTime,
  }) async {
    try {
      final headers = {
        'Authorization': 'Bearer ${Constants.userToken}',
      };
      final body = {
        'reserve_date': dateTime.toString(),
      };
      final response = await dio.post(
        '${Constants.booking}$id',
        data: body,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        print('booking done successfully');
      }
      return response;
    } catch (e) {
      throw Exception('Failed to book : $e');
    }
  }
}
