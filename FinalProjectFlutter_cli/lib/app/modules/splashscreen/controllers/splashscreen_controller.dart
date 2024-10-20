import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  // Variabel untuk memeriksa apakah pengguna sudah login
  var isUserLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkUserLoginStatus();
  }

  // Fungsi untuk mengecek status login pengguna
  void checkUserLoginStatus() {
    // Mengecek apakah pengguna saat ini sudah login
    isUserLoggedIn.value = FirebaseAuth.instance.currentUser != null;
  }

  // Fungsi untuk melakukan logout
  void logout() async {
    await FirebaseAuth.instance.signOut();
    isUserLoggedIn.value = false;
    Get.offAllNamed('/login'); // Mengarahkan ke halaman login setelah logout
  }
}
