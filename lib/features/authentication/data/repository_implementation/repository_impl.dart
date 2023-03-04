import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/exceptions.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/core/network/network_info.dart';
import 'package:wevr_app/features/authentication/data/models/register_model.dart';
import 'package:wevr_app/features/authentication/domain/entities/register.dart';
import 'package:wevr_app/features/authentication/domain/repository/auth_repository.dart';

import '../data_sources/remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Register>> register({
    required String userName,
    required String email,
    required String phone,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.register(
          userName: userName,
          email: email,
          phone: phone,
        );
        return Right(result);
      } else {
        throw OfflineException();
      }
    } on ServerException {
      return Left(ServerFailure());
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }
}















// import '../../../../core/errors/api_result.dart';
// import '../../../../core/errors/network_exceptions.dart';
// import '../data_sources/remote_data_source/web_services.dart';
// import '../models/login_model/login_model.dart';
// import '../models/register_model/register_model.dart';

// import '../../domain/repository/auth_repository.dart';

// class UsersRepositoryImpl implements AuthRepository {
//   final WebService webService;

//   UsersRepositoryImpl(this.webService);
//   @override
//   Future<ApiResult<RegisterModel>> registerNewUser(
//       RegisterModel registerModel) async {
//     try {
//       var response = await webService.register(registerModel);
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(NetworkExceptions.getDioException(error));
//     }
//   }

//   @override
//   Future<ApiResult<LoginModel>> loginUser(LoginModel loginModel) async {
//     try {
//       var response = await webService.login(loginModel);
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(NetworkExceptions.getDioException(error));
//     }
//   }

//   @override
//   Future<ApiResult<dynamic>> logout(String token) async {
//     try {
//       var response = await webService.logout(token);
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(NetworkExceptions.getDioException(error));
//     }
//   }
// }
