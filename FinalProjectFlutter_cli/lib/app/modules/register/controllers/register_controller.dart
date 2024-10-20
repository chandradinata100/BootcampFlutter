import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> register(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      errorMessage.value = 'Pendaftaran berhasil!';
    } catch (e) {
      errorMessage.value = 'Pendaftaran gagal: $e';
    } finally {
      isLoading.value = false;
    }
  }
}