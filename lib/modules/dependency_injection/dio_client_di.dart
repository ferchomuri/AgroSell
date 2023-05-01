import 'package:dio/dio.dart';
import 'package:agrosell/features/app/models/env_model.dart';
import 'package:agrosell/modules/dio/dio_client.dart';
import 'package:agrosell/modules/token_refresh/dio_token_refresh.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioInjection {
  Dio dio(EnvModel env, DioTokenRefresh dioTokenRefresh) =>
      initDioClient(env, dioTokenRefresh);
}
