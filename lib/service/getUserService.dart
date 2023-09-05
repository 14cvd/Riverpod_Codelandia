import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_codelandia/model/userModel.dart';

// sealed class GetUserService {
//   static List dataItem = [];
//   static final Dio _networkManager =
//       Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
//   static Future<void> fetchUserItem() async {
//     var response = await _networkManager.get("/users");

//     if (response.statusCode == HttpStatus.ok) {
//       var data = response.data;

//       if (data is List) {
//         dataItem = data.map((e) => UserModel.fromJson(e)).toList();
//       }
//     }
//   }
// }

// final fetchUserItemProvider = Provider<UserModel?>((ref) {
//   final Dio networkManager =
//       Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
//   Future<List<UserModel>> fetchUserItem() async {
//     var response = await networkManager.get("/users");

//     if (response.statusCode == HttpStatus.ok) {
//       var data = response.data;

//       if (data is List) {
//         return data.map((e) => UserModel.fromJson(e)).toList();
//       }
//     }

//     return [];
//   }

//   return null;
// });

final networkManeger = Provider<Dio>(((ref) =>
    Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"))));

final fetchUserProvider = FutureProvider<List<UserModel>>((ref) async {
  var response = await ref.watch(networkManeger).get("/users");

  if (response.statusCode == HttpStatus.ok) {
    var data = response.data;

    if (data is List) {
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
  }

  return [];
});
