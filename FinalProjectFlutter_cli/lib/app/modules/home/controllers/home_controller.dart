import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  void startLoading() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 0), () {
      isLoading.value = false;
      Get.toNamed('/weather'); // Navigasi ke WeatherPage setelah selesai
    });
  }
}
