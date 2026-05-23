import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fitmore_web/core/network/dio_client.dart';
import 'package:fitmore_web/core/network/dio_error_handler.dart';
import 'package:fitmore_web/features/auth/data/models/auth_model.dart';
import 'package:fitmore_web/features/auth/data/models/signup_model.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpModel> signUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  });

  Future<AuthModel> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<SignUpModel> signUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    log('signUp called for email: $email', name: 'AuthRemoteDataSourceImpl');
    try {
      final response = await _dioClient.post(
        '/api/signup',
        data: {
          "username": username,
          "email": email,
          "password": password,
          "phonenumber": phoneNumber,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SignUpModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/signup'),
          message: "Failed to sign up",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    log('login called for email: $email', name: 'AuthRemoteDataSourceImpl');
    try {
      final response = await _dioClient.post(
        '/api/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/login'),
          message: "Failed to login",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
