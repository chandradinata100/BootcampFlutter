import 'package:flutter/material.dart';
import 'package:tugas_11/user/model/user_model.dart';
import 'package:tugas_11/user/page/detail_user_page.dart';
import 'package:tugas_11/user/service/user_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await UserService().fetchUser();
    print('Ini data user ${users.length}');
    setState(() {}); // Tambahkan setState untuk merender ulang tampilan setelah data diambil
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Page')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            title: Text('${users[index].firstName} ${users[index].lastName}'),
            leading: Image.network(users[index].avatar),
            onTap: () { // Tambahkan onTap untuk navigasi ke DetailUserPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailUserPage(userID: users[index].id),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
