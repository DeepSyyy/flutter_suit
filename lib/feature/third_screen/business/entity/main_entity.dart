import 'package:suit_media/feature/third_screen/business/entity/sub_entity.dart';

class DataEntity {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserEntity> data;

  DataEntity({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });
}
