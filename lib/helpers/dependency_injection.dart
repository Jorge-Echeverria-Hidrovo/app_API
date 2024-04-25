import 'package:dio/dio.dart';
import 'package:dio_app/api/photo_api.dart';
import 'package:dio_app/helpers/base_http_dio.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjection {
  static void initialize() {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://picsum.photos/v2/'),
    );

    BaseHttpDio baseHttpDio = BaseHttpDio(dio);

    final PhotoAPI photoAPI = PhotoAPI(baseHttpDio);
    GetIt.instance.registerSingleton<PhotoAPI>(photoAPI);
  }
}
