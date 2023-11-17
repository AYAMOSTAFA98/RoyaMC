import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../i_api_caller.dart';
import 'api_caller_dio_providers.dart';
import 'extensions/api_error_extension.dart';
part 'api_caller.g.dart';

@Riverpod(keepAlive: true)
ApiCaller apiCaller(ApiCallerRef ref) {
  return ApiCaller(
    dio: ref.watch(apiCallerDioProvider),
    //authLocalDataSource: ref.watch(authLocalDataSourceProvider),
  );
}

class ApiCaller implements IApiCaller {
  ApiCaller({
    required this.dio,
  });

  final Dio dio;
  

  @override
  Future<Response<T>> postData<T>({
    required String path,
    Map<String, String>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    
    return _errorHandler(
      () async {
        return dio.post(
          path,
          queryParameters: queryParameters,
          data: FormData.fromMap(data as Map<String, dynamic>),
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Accept-Language': 'en',
              //'Authorization': 'Bearer $token',
            },
          ),
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<T> _errorHandler<T>(Future<T> Function() body) async {
    try {
      return await body();
    } catch (e, st) {
      final error = e.apiErrorToServerException();
      throw Error.throwWithStackTrace(error, st);
    }
  }
}
