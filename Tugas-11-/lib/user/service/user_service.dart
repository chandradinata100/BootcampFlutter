import 'package:dio/dio.dart';
import 'package:tugas_11/user/model/user_model.dart';

class UserService {
  Dio dio = Dio();
  static const url = 'https://reqres.in/api/users';

  Future<List<UserModel>> fetchUser() async {
    try {
      final response = await dio.get('$url?page=2');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        List<UserModel> users =
            List.from(data.map((user) => UserModel.fromJson(user)));
        return users;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi detailUser untuk mengambil detail user berdasarkan userID
  Future<UserModel> detailUser(int userID) async {
    try {
      final response = await dio.get('$url/$userID');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        return UserModel.fromJson(data);
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
