import 'package:dio/dio.dart';
import 'package:fitmore_web/core/constants/api_constants.dart';
import 'package:fitmore_web/features/user/data/models/user_model.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_handler.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
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
    } on Exception catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
