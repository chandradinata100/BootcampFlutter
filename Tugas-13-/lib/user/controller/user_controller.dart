import 'package:get/get.dart';
import 'package:tugas_11/user/model/user_model.dart';
import 'package:tugas_11/user/service/user_service.dart';

class UserController extends GetxController {
  var users = <UserModel>[].obs;
  final UserService userService = UserService();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      final fetchedUsers = await userService.fetchUser();
      users.value = fetchedUsers;
    } catch (e) {
      print('Error fetching users: $e');
    }
  }
}
