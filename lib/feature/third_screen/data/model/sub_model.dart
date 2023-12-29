import 'dart:convert';

import 'package:suit_media/feature/third_screen/business/entity/sub_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  }) : super(
          id: id,
          email: email,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
