import 'package:dio/dio.dart';
import 'package:fitmore_web/core/constants/api_constants.dart';
import 'package:fitmore_web/features/user/data/models/user_model.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_handler.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> getUserById(int id);
  Future<void> deleteUser(int id);
  Future<UserModel> updateUser(int id, UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dioClient.get(ApiConstants.usersEndpoint);
      if (response.statusCode == 200) {
        return (response.data['datas'] as List<dynamic>)
            .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: ApiConstants.usersEndpoint),
          message: "Failed to load users",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    try {
      final response = await _dioClient.post(
        '/api/user',
        data: user.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/user'),
          message: "Failed to create user",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  @override
  Future<UserModel> getUserById(int id) async {
    try {
      final response = await _dioClient.get('/user/$id');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/user/$id'),
          message: "Failed to fetch user",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      final response = await _dioClient.delete(
        '/api/user',
        queryParameters: {'id': id},
      );
      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/user'),
          message: "Failed to delete user",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  @override
  Future<UserModel> updateUser(int id, UserModel user) async {
    try {
      final response = await _dioClient.put(
        '/api/user',
        queryParameters: {'id': id},
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/user'),
          message: "Failed to update user",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
