import 'dart:developer';

import 'package:byte_wolves/constants/api.dart';
import 'package:byte_wolves/models/lecture.dart';
import 'package:dio/dio.dart';

class LectureService {
  final dio = Dio();

  Future<List<Lecture>> getAll() async {
    final response = await dio.get(ApiConstants.lecturesUrl);
    List<Lecture> lectures = [];

    for (var item in response.data) {
      lectures.add(Lecture.fromJson(item));
    }
    return lectures;
  }

  Future<Lecture> getById(int id) async {
    final response = await dio.get('${ApiConstants.lecturesUrl}/$id');
    Lecture lecture;

    if (response.statusCode! < 300) {
      lecture = Lecture.fromJson(response.data);
      log(lecture.toString());
    }
    return Lecture.fromJson(response.data);
  }
}