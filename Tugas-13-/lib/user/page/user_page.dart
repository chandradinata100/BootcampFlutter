import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_11/user/model/user_model.dart';
import 'package:tugas_11/user/page/detail_user_page.dart';
import 'package:tugas_11/user/controller/user_controller.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User Page')),
      ),
      body: Obx(() {
        if (userController.users.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                title: Text('${user.firstName} ${user.lastName}'),
                leading: Image.network(user.avatar),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailUserPage(userID: user.id),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
