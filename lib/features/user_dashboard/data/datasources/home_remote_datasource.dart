import 'package:dio/dio.dart';
import 'package:wevr_app/features/user_dashboard/data/models/search_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants_manager.dart';
import '../models/apartment_model.dart';
import '../models/save_apartment_model.dart';
import '../models/saved_aparments_model.dart';

abstract class HomeRemoteDataSource {
  Future<ApartmentModel> getApartments();

  Future<SaveApartmentModel> saveApartment({required int id});

  Future<SavedApartmentsModel> getSavedApartments();

  Future<List<SearchModel>> searchApartments({required String query});
}

class HomeRemoteDataSourceDio implements HomeRemoteDataSource {
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
  Future<ApartmentModel> getApartments() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${ConstantsManager.userToken!}',
      };
      final response = await dio.get(
        ConstantsManager.apartment,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final ApartmentModel apartments = ApartmentModel.fromJson(
            response.data);
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
        'Authorization': 'Bearer ${ConstantsManager.userToken!}',
      };
      final response = await dio.get(
        ConstantsManager.savedApartment,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final SavedApartmentsModel apartments = SavedApartmentsModel.fromJson(
            response.data);
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
        'Authorization': 'Bearer ${ConstantsManager.userToken!}',
      };
      final response = await dio.post(
        '${ConstantsManager.saveApartment}$id',
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
        'Authorization': 'Bearer ${ConstantsManager.userToken!}',
      };
      final response = await dio.get(
        ConstantsManager.search, queryParameters: {'query': query},
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final List<SearchModel> results = (response.data['data'] as List).map((
            apartmentJson) => SearchModel.fromJson(apartmentJson))
            .toList();
        return results;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw Exception('Failed to load apartments: $e');
    }
  }


}