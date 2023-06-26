

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/authentication/data/data_sources/remote_datasource.dart';
import '../../features/authentication/data/repository_implementation/repository_impl.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';
import '../../features/authentication/domain/use_cases/check_otp_usecase.dart';
import '../../features/authentication/domain/use_cases/create_new_password.dart';
import '../../features/authentication/domain/use_cases/forgot_password_usecase.dart';
import '../../features/authentication/domain/use_cases/login_usecase.dart';
import '../../features/authentication/domain/use_cases/logout_usecase.dart';
import '../../features/authentication/domain/use_cases/register_usecase.dart';
import '../../features/authentication/presentation/controller/OTP/otp_cubit.dart';
import '../../features/authentication/presentation/controller/create_new_password/cubit.dart';
import '../../features/authentication/presentation/controller/login/cubit.dart';
import '../../features/authentication/presentation/controller/register/cubit.dart';
import '../../features/map_based_homes/presentation/controller/map/map_cubit.dart';
import '../../features/user_dashboard/data/datasources/auction_remote_datasource.dart';
import '../../features/user_dashboard/data/datasources/home_remote_datasource.dart';
import '../../features/user_dashboard/data/repository_implementation/auction_repo_impl.dart';
import '../../features/user_dashboard/data/repository_implementation/home_repository_implementation.dart';
import '../../features/user_dashboard/domain/repository/auction_repo.dart';
import '../../features/user_dashboard/domain/repository/home_repository.dart';
import '../../features/user_dashboard/domain/use_cases/Save_apartment_usecase.dart';
import '../../features/user_dashboard/domain/use_cases/auction/get_auction_usecase.dart';
import '../../features/user_dashboard/domain/use_cases/book_visit_usecase.dart';
import '../../features/user_dashboard/domain/use_cases/get_apartment_use_case.dart';
import '../../features/user_dashboard/domain/use_cases/get_saved_apartments_usecase.dart';
import '../../features/user_dashboard/domain/use_cases/search_filter_usecase.dart';
import '../../features/user_dashboard/domain/use_cases/search_usecase.dart';
import '../../features/user_dashboard/presentation/controller/Home/cubit.dart';
import '../../features/user_dashboard/presentation/controller/auction/auction_cubit.dart';
import '../../features/user_dashboard/presentation/controller/save/cubit.dart';
import '../../features/user_dashboard/presentation/controller/search/cubit.dart';
import '../network/network_info.dart';

part 'service_locator.dart';