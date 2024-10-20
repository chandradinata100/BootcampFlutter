import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void loginWithEmailPassword(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      // Login menggunakan Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Jika berhasil, arahkan ke HomePage
      Get.offAllNamed('/splashscreen');
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? 'Login Gagal';
    } finally {
      isLoading.value = false;
    }
  }
}
