// ignore_for_file: unnecessary_this

import 'package:mongo_dart/mongo_dart.dart';

class UserModel {
  ObjectId? id;
  String? username;
  String? password;
  String? ciphertext;

  UserModel({this.id, this.username, this.password, this.ciphertext});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['name'];
    password = json['password'];
    ciphertext = json['ciphertext'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.username;
    data['password'] = this.password;
    data['ciphertext'] = this.ciphertext;
    return data;
  }
}
