import 'package:dio/dio.dart';

// Http 基底 
class HttpService {
  late Dio _dio;

  HttpService({required String baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> _request(String path, Object? queryParameters, {required String method}) async {
    Response response;
    try {
      response = await _dio.request(path, data: queryParameters, options: Options(method: method));
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  // 參數直接帶入queryParameters e.g.'/test?id=12&name=dio'
  Future<Response> get(String path, Object? queryParameters) async {
    return _request(path, queryParameters, method: 'get');
  }

  // queryParameters: {'id': 12, 'name': 'dio'}
  Future<Response> post(String path, Object? queryParameters) async {
    return _request(path, queryParameters, method: 'post');
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }
}