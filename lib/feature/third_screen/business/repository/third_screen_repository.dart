import 'package:dartz/dartz.dart';
import 'package:suit_media/core/errors/failure.dart';
import 'package:suit_media/feature/third_screen/business/entity/main_entity.dart';

abstract class ThirdScreenRepository {
  Future<Either<Failure, DataEntity>> getUser({required String pageTotal});
}
