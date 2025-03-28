// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tumi_nol/main.export.dart';

typedef FutureEither<F, T> = Future<Either<F, T>>;

typedef Report<T> = Either<Failure, T>;
typedef FutureReport<T> = Future<Report<T>>;

Either<Failure, R> failure<R>(String msg, {Object? e, StackTrace? s}) {
  return Left(Failure(msg, error: e, stackTrace: s ?? StackTrace.current));
}

Future<T> failToErr<T>(Failure f) {
  return f.toFuture<T>();
}

class Failure {
  const Failure(
    this.message, {
    this.errors = const <String, String>{},
    this.error,
    StackTrace? stackTrace,
    this.isTimeOut = false,
    this.endpoint,
  }) : _stackTrace = stackTrace;

  //?? dio
  // factory Failure.fromDio(DioException ex, [StackTrace? st]) {
  //   String path = ex.requestOptions.path;
  //   if (path.startsWith('http')) {
  //     path = path.split('/api/').last;
  //   }
  //   final failure = Failure(
  //     ex.type.isTimeout ? TIMEOUT : ex.message ?? kErrorMessage('from Dio'),
  //     error: ex.error,
  //     stackTrace: st ?? ex.stackTrace,
  //     isTimeOut: ex.type.isTimeout,
  //     endpoint: path.split('/').takeFirst(2).lastOrNull?.titleCase.split('?').firstOrNull,
  //   );
  //   dynamic res = ex.response?.data;

  //   if (res is String) res = jsonDecode(res);

  //   // check if res is [Map] and contains a key 'data' which is [Map<dynamic,dynamic>]
  //   if (res case {'data': Map resData}) {
  //     // check if resData contains a key 'error' and is String
  //     if (resData case {'error': String e}) return failure.copyWith(message: e);

  //     // check if resData contains a key 'message' and is String
  //     if (resData case {'message': String e}) {
  //       return failure.copyWith(message: e);
  //     }

  //     // check if resData contains a key 'errors' and is [Map<dynamic,dynamic>]
  //     if (resData case {'errors': Map errList}) {
  //       Map<String, String> errors = {};
  //       errList.forEach((k, v) {
  //         // if the value is a List then convert it to List<String>
  //         if (v is List) {
  //           errors[k] = List<String>.from(v.map((e) => '$e').toList()).first;
  //         } else {
  //           errors[k] = v.toString();
  //         }
  //       });

  //       return failure.copyWith(errors: errors, message: errors.values.firstOrNull);
  //     }
  //   }

  //   if (res case {'message': String msg}) {
  //     return failure.copyWith(message: msg);
  //   }

  //   return failure;
  // }

  /// The original error obj
  final Object? error;

  /// List of error messages in KEY-VALUE format
  final Map<String, String> errors;

  /// The main message of the error
  final String message;

  final StackTrace? _stackTrace;
  final bool isTimeOut;
  final String? endpoint;

  @override
  String toString() => message;

  StackTrace get stackTrace => _stackTrace ?? StackTrace.current;

  Map<String, dynamic> toMap() {
    return {'message': message, 'errors': errors, 'error': error, 'isTimeOut': isTimeOut};
  }

  String? getErr([String? key]) => key != null ? errors[key] : errors.values.firstOrNull;

  String err([String? name]) => errors.values.firstOrNull ?? error?.toString() ?? kError(name);

  String errOrMsg() => errors.values.firstOrNull ?? message;

  bool get isNoData => message.low == 'no result found';

  String get safeMsg => kReleaseMode ? 'Something Went Wrong' : message;
  String? get safeBody => kReleaseMode ? 'Please Try Again' : null;

  Failure copyWith({
    String? message,
    Map<String, String>? errors,
    Object? apiError,
    StackTrace? stackTrace,
    bool? isTimeOut,
    String? endpoint,
  }) {
    return Failure(
      message ?? this.message,
      errors: errors ?? this.errors,
      stackTrace: stackTrace ?? _stackTrace,
      error: apiError ?? error,
      isTimeOut: isTimeOut ?? this.isTimeOut,
      endpoint: endpoint ?? this.endpoint,
    );
  }

  Future<T> toFuture<T>() {
    final future = Future<T>.error(this, stackTrace);
    return future;
  }

  AsyncError<T> toAsyncError<T>() {
    final error = AsyncError<T>(this, stackTrace);
    return error;
  }

  Failure copyWithMessage(String msg) => copyWith(message: msg);

  void log(String name) {
    catErr(name, message, stackTrace);
    cat(errors, 'Failure Errors');
  }
}
