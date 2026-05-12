import 'package:dio/dio.dart';

/// Handles Dio exceptions and returns user-friendly error messages
class DioErrorHandler {
  /// Converts a DioException to a user-friendly error message
  static String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again.";

      case DioExceptionType.sendTimeout:
        return "Request timeout. Please try again.";

      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond.";

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      case DioExceptionType.connectionError:
        return "No internet connection.";

      case DioExceptionType.badCertificate:
        return "Security certificate error.";

      case DioExceptionType.unknown:
        return _handleUnknownError(error);
    }
  }

  /// Handles bad response errors with more specific messages
  static String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    // Try to extract error message from response
    if (responseData != null) {
      if (responseData is Map) {
        // Check for common error message fields
        if (responseData.containsKey('message')) {
          return responseData['message'].toString();
        }
        if (responseData.containsKey('error')) {
          return responseData['error'].toString();
        }
        if (responseData.containsKey('errors')) {
          return responseData['errors'].toString();
        }
      }
    }

    // Return status code specific messages
    switch (statusCode) {
      case 201:
        return "Created successfully.";
      case 400:
        return "Bad request. Please check your input.";
      case 413:
        return 'File too large';
      case 403:
        return "Access forbidden. You don't have permission.";
      case 404:
        return "Resource not found.";
      case 422:
        return "Validation error. Please check your input.";
      case 500:
        return "Internal server error. Please try again later.";
      case 502:
        return "Bad gateway. Please try again later.";
      case 503:
        return "Service unavailable. Please try again later.";
      default:
        return "Server error: ${statusCode ?? 'Unknown'}";
    }
  }

  /// Handles unknown errors
  static String _handleUnknownError(DioException error) {
    if (error.error != null) {
      final errorMessage = error.error.toString();

      // Check for common network errors
      if (errorMessage.contains('SocketException')) {
        return "No internet connection.";
      }
      if (errorMessage.contains('HandshakeException')) {
        return "Security certificate error.";
      }
      if (errorMessage.contains('FormatException')) {
        return "Invalid data format received.";
      }
    }

    return "Something went wrong. Please try again.";
  }

  /// Gets a short error message suitable for snackbars
  static String getShortErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Timeout error";

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        return "Error ${statusCode ?? 'Unknown'}";

      case DioExceptionType.cancel:
        return "Request cancelled";

      case DioExceptionType.connectionError:
        return "No internet";

      case DioExceptionType.badCertificate:
        return "Certificate error";

      default:
        return "Error occurred";
    }
  }

  /// Checks if the error is a network connectivity issue
  static bool isNetworkError(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        (error.type == DioExceptionType.unknown &&
            error.error.toString().contains('SocketException'));
  }

  /// Checks if the error is a timeout issue
  static bool isTimeoutError(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout;
  }

  /// Checks if the error is a server error (5xx)
  static bool isServerError(DioException error) {
    final statusCode = error.response?.statusCode;
    return statusCode != null && statusCode >= 500 && statusCode < 600;
  }

  /// Checks if the error is a client error (4xx)
  static bool isClientError(DioException error) {
    final statusCode = error.response?.statusCode;
    return statusCode != null && statusCode >= 400 && statusCode < 500;
  }
}
