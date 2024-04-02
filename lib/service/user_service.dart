import 'package:byte_wolves/constants/api.dart';
import 'package:byte_wolves/models/user.dart';
import 'package:dio/dio.dart';

class UserService {
  final dio = Dio();

  Future<List<User>> getAll() async {
    final response = await dio.get(ApiConstants.usersUrl);
    List<User> users = [];
    for (var item in response.data) {
      users.add(User.fromJson(item));
    }
    return users;
  }

  Future<User> getById(int id) async {
    final response = await dio.get('${ApiConstants.usersUrl}/$id');
    return User.fromJson(response.data);
  }

  void update(User user) async {
    dio.put('${ApiConstants.usersUrl}/${user.id}', data: user.toJson());
  }
}
