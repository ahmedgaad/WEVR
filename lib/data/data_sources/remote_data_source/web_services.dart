import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:wevr_app/data/models/register_model/register_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://college.makkah-tech.com/api/")
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  @POST("register")
  Future<RegisterModel> register(
    @Body() RegisterModel registerModel,
  );
}