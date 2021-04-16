import 'package:aesthenics/utils/Constants.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, Constants.errorCommunication);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, Constants.invalidRequest);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, Constants.unauthorised);
}

class InvalidInputException extends AppException {
  InvalidInputException([String message])
      : super(message, Constants.invalidInput);
}
