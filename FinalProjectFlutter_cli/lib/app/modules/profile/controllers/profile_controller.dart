import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() {
    // Mendapatkan email pengguna dari Firebase Authentication
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email.value = user.email ?? 'No email';
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login'); // Arahkan ke halaman login setelah logout
  }
}
