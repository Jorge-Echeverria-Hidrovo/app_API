import 'package:dio_app/helpers/base_http_dio.dart';
import 'package:dio_app/models/photo.dart';

class PhotoAPI {
  final BaseHttpDio baseHttpDio;

  PhotoAPI(this.baseHttpDio);

  Future<List<PhotoResponse>> getAllPhotos() async {
    final response = await baseHttpDio.resquest('/list', method: 'GET');
    List<dynamic> responseData = response.data;
    List<PhotoResponse> photos = responseData
        .map((json) => PhotoResponse.fromJson(json))
        .toList();
    return photos;
  }
}