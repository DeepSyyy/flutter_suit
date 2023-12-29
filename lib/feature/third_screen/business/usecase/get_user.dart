import 'package:dartz/dartz.dart';
import 'package:suit_media/core/errors/failure.dart';
import 'package:suit_media/feature/third_screen/business/entity/main_entity.dart';
import 'package:suit_media/feature/third_screen/business/repository/third_screen_repository.dart';

class GetUser {
  final ThirdScreenRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, DataEntity>> call({required int pageTotal}) async {
    return await repository.getUser(pageTotal: pageTotal);
  }
}
