import 'dart:io';

import 'package:dio/dio.dart';

class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions(this._message, this._prefix);

  @override
  String toString() {
    return "$_message$_prefix";
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException(String? message)
      : super(message, "No Internet Exceptions");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException(String? message)
      : super(message, "You dont have access to this");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException(String? message) : super(message, "Request time out");
}

class FetchDataException extends AppExceptions {
  FetchDataException(String? message) : super(message, "");
}

Exception handleDioError(DioException error) {
  if (error.type == DioExceptionType.connectionTimeout ||
      error.type == DioExceptionType.receiveTimeout) {
    return FetchDataException("Request timed out");
  } else if (error.error is SocketException) {
    return NoInternetException("No Internet connection");
  } else if (error.response?.statusCode == 401) {
    return UnauthorizedException("Unauthorized");
  } else {
    return FetchDataException("Something went wrong");
  }
}
