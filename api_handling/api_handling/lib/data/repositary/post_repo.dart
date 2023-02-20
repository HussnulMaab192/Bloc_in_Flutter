import 'dart:developer';

import 'package:api_handling/data/api/api.dart';
import 'package:dio/dio.dart';

import '../models/post_model.dart';

class PostRepo {
  Future<List<PostModel>> fetchPosts() async {
    Api api = Api();

    try {
      Response resp = await api.sendRequest.get("/todos");

      List<dynamic> todos = resp.data;
      return todos.map((e) => PostModel.fromJson(e)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
