import 'package:flutter/material.dart';
import 'package:tugas_11/user/model/user_model.dart';
import 'package:tugas_11/user/service/user_service.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({super.key, required this.userID});
  final int userID;

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  UserModel? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      user = await UserService().detailUser(widget.userID);
    } catch (e) {
      print('Error fetching user details: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : user != null
                ? ListTile(
                    title: Text('${user?.firstName} ${user?.lastName}'),
                    leading: Image.network(user?.avatar ?? ''),
                    subtitle: Text(user?.email ?? ''),
                  )
                : const Center(
                    child: Text('User data could not be retrieved.'),
                  ),
      ),
    );
  }
}
