import 'package:finalprojectflut_cli/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menjalankan navigasi ke halaman sesuai status login setelah 3 detik
    Future.delayed(Duration(seconds: 3), () {
      // Periksa apakah user sudah login
      if (Get.find<AuthController>().isUserLoggedIn.value) {
        Get.offAllNamed('/home'); // Arahkan ke HomePage jika sudah login
      } else {
        Get.offAllNamed('/login'); // Arahkan ke LoginPage jika belum login
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFEDFDFF),
      body: Center(
        child: Image.asset(
          'assets/Images/Cuaca.png', // Sesuaikan dengan path gambar logo Anda
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
