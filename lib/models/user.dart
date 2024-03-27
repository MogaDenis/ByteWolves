class User {
  int id;
  String email;
  String username;
  String password;
  int lectures;
  int experience;
  int level;

  User(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.lectures,
      required this.experience,
      required this.level});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      lectures: json['lectures'] as int,
      experience: json['experience'] as int,
      level: json['level'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'lectures': lectures,
      'experience': experience,
      'level': level,
    };
  }
}
