import 'dart:developer';

import 'package:byte_wolves/constants/api.dart';
import 'package:byte_wolves/models/question.dart';
import 'package:dio/dio.dart';

class QuestionService {
  final dio = Dio();
  Future<List<Question>> getAll() async {
    final response = await dio.get(ApiConstants.questionUrl);
    List<Question> questions = [];
    for (var item in response.data) {
      questions.add(Question.fromJson(item));
    }
    return questions;
  }

  Future<Question> getById(int id) async {
    final response = await dio.get('${ApiConstants.questionUrl}/$id');
    Question question;
    if (response.statusCode! < 300) {
      question = Question.fromJson(response.data);
      log(question.toString());
    }
    return Question.fromJson(response.data);
  }
}

final questionService = QuestionService();
