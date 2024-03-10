class Question {
  final int id;
  final int lectureId;
  final String type;
  final String text;
  final String correctAnswer;
  final String wa1;
  final String wa2;
  final String wa3;

  Question(
      {required this.id,
      required this.lectureId,
      required this.type,
      required this.text,
      required this.correctAnswer,
      required this.wa1,
      required this.wa2,
      required this.wa3});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      lectureId: json['lectureId'] as int,
      type: json['type'] as String,
      text: json['text'] as String,
      correctAnswer: json['correctAnswer'] as String,
      wa1: json['wA1'] as String,
      wa2: json['wA2'] as String,
      wa3: json['wA3'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lectureId': lectureId,
      'type': type,
      'text': text,
      'correctAnswer': correctAnswer,
      'wa1': wa1,
      'wa2': wa2,
      'wa3': wa3,
    };
  }
}
