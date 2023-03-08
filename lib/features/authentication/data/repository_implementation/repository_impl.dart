import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/features/authentication/domain/entities/login.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/register.dart';
import '../../domain/repository/auth_repository.dart';
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
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.register(
            userName: userName,
            email: email,
            phone: phone,
            password: password,
            passwordConfirmation: passwordConfirmation);
        return Right(result);
      } else {
        throw OfflineException();
      }
    } on RegisterException catch (failure){
      return Left(ServerFailure(failure.registerErrorModel.errorMessage));
    } on OfflineException {
      return Left(OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, Login>> login({required String email, required String password, required String deviceInformation}) {
    // TODO: implement login
    throw UnimplementedError();
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
