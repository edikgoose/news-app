import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  String name;
  String phone;
  String surname;
  String nickname;
  String mail;

  UserModel(this.name, this.surname, this.nickname, this.phone, this.mail);

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'],
        nickname = json['nickname'],
        phone = json['phone'],
        mail = json['mail'];
}