import 'dart:convert';

import 'package:suit_media/feature/third_screen/business/entity/main_entity.dart';
import 'package:suit_media/feature/third_screen/data/model/sub_model.dart';

class DataModel extends DataEntity {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;

  DataModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  }) : super(
          page: page,
          perPage: perPage,
          total: total,
          totalPages: totalPages,
          data: data,
        );

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<UserModel>.from(
          json["data"].map(
            (x) => UserModel.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
