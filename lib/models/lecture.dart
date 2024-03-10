import 'package:byte_wolves/models/question.dart';

class Lecture {
  final int id;
  final String title;
  final String body;
  final String youtubeUrl;
  List<Question> questions = [];

  Lecture(
      {required this.id,
      required this.title,
      required this.body,
      required this.youtubeUrl, required this.questions});

  // Future<void> initAsync() async {
  //   questions = await questionService.getAll().then((allQuestions) =>
  //       allQuestions.where((item) => item.lectureId == id).toList());
  // }

  factory Lecture.fromJson(Map<String, dynamic> json) {
    var questionList = json['questions'] as List<dynamic>? ?? [];
    List<Question> questions = questionList.map<Question>((item) => Question.fromJson(item)).toList();


    return Lecture(
      id: json['id'] as int,
      questions: questions,
      title: json['name'] as String,
      body: json['text'] as String,
      youtubeUrl: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questions': questions,
      'name': title,
      'text': body,
      'youtubeUrl': youtubeUrl,
    };
  }
}