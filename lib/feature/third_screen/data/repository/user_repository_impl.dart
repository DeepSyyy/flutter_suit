import 'package:dartz/dartz.dart';
import 'package:suit_media/core/errors/failure.dart';
import 'package:suit_media/feature/third_screen/business/repository/third_screen_repository.dart';
import 'package:suit_media/feature/third_screen/data/datasource/user_remote_data_source.dart';
import 'package:suit_media/feature/third_screen/data/model/main_model.dart';

class UserRepostoryImpl implements ThirdScreenRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepostoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, DataModel>> getUser(
      {required String pageTotal}) async {
    try {
      final result = await remoteDataSource.getUser(pageTotal: pageTotal);
      return Right(result);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'gagal mendapatkan data, karena $e'));
    }
  }
}
