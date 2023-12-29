import 'package:dio/dio.dart';
import 'package:suit_media/feature/third_screen/data/model/main_model.dart';

abstract class UserRemoteDataSource {
  Future<DataModel> getUser({required int pageTotal});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.dio});
  final Dio dio;
  @override
  Future<DataModel> getUser({required int pageTotal}) async {
    final response =
        await dio.get("https://reqres.in/api/users", queryParameters: {
      "page": pageTotal,
      "per_page": 4,
    });
    if (response.statusCode == 200) {
      return DataModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
