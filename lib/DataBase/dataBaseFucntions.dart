// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';


import 'package:mongo_dart/mongo_dart.dart';
import 'package:tailorapp_assignment/DataBase/userModel.dart';

import 'constant.dart';

// Define your model class
class MongoDbManager {
  static var db, usersCollection;

  static connect() async {
    db = await Db.create(MongoURL);
    await db.open();
  }

  Future<void> insertUser(UserModel user) async {
    // Get the collection reference
    usersCollection = db.collection(USER_COLLECTION);

    // Insert the user data (converted to Map)
    await usersCollection.insertOne(user.toJson());

    print('User inserted successfully!');
  }

  Future<void> insertVideoData(dynamic data) async {
    // Get the collection reference
    usersCollection = db.collection(VIDEO_COLLECTION);

    // Insert the user data (converted to Map)
    await usersCollection.insertAll(data);

    print('User inserted successfully!');
  }

  Future<List<Map<String, dynamic>>> getUserData() async {
    usersCollection = db.collection(USER_COLLECTION);
    final result = await usersCollection.find().toList();
    return result;
  }

  Future<List<Map<String, dynamic>>> getVideoData() async {
    usersCollection = db.collection(VIDEO_COLLECTION);
    final result = await usersCollection.find().toList();
    return result;
  }
}
