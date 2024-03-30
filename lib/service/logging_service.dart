import 'package:dio/dio.dart';

import '../constants/api.dart';
import '../models/user.dart';

//Function for logging up the user
Future<void> signUp(User user) async {
  var dio = Dio();
  await dio.post(ApiConstants.usersUrl, data: user.toJson());
}

//Function for logging in the user
Future<User> signIn(User user) async {
  var dio = Dio();
  final response = await dio.get(ApiConstants.usersUrl);
  for (var item in response.data) {
    if (item['username'] == user.username && item['password'] == user.password) {
      return User.fromJson(item);
    }
  }
  if (response.data.isEmpty) {
    throw Exception('No user found');
  }
  throw Exception('Invalid credentials');
}
