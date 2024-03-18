import 'package:dio/dio.dart';
import 'package:movie_app_assignment/data/model/common_response_model.dart';

class HTTP {
  static Dio _loggerDio(Dio dio) {
    dio.interceptors.addAll(
      <Interceptor>[
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            return handler.next(options);
          },
          onResponse: (Response options, ResponseInterceptorHandler handler) {
            return handler.next(options);
          },
          onError: (DioError error, ErrorInterceptorHandler handler) {
            return handler.next(error);
          },
        ),
      ],
    );
    return dio;
  }

  static Dio get others => _loggerDio(Dio());


}
