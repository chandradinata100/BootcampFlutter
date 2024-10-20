import 'package:finalprojectflut_cli/app/data/model/weather_model.dart';
import 'package:finalprojectflut_cli/app/data/service/weather_service.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  final WeatherService _weatherService = WeatherService('5821a06c8f9f37ffc65a15164c90bc49');
  var weather = Rx<Weather?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  void fetchWeather() async {
    isLoading.value = true;
    try {
      String cityName = await _weatherService.getCurrentCity();
      Weather weatherData = await _weatherService.getWeather(cityName);
      weather.value = weatherData;
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = 'Failed to load weather data: $e';
    } finally {
      isLoading.value = false;
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/rainStorm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  Map<String, String> getWeatherRecommendation(String? mainCondition) {
    switch (mainCondition?.toLowerCase()) {
      case 'clear':
        return {
          'title': 'Cuaca Yang Baik Untuk Beraktivitas',
          'message': 'Gunakan Waktu-mu untuk berolahraga, berkebun, ataupun kegiatan lainnya!',
        };
      case 'clouds':
        return {
          'title': 'Cuaca Sedang Mendung',
          'message': 'Sepertinya akan hujan',
        };
      case 'thunderstorm':
        return {
          'title': 'Cuaca Sedang Hujan Deras disertai Petir',
          'message': 'Waspada Listrik Padam',
        };
      case 'shower rain':
      case 'rain':
        return {
          'title': 'Cuaca Sedang Hujan',
          'message': 'Lebih Baik Bersantai di Rumah',
        };
      default:
        return {
          'title': 'Cuaca Tidak Dikenali',
          'message': 'Tetap berhati-hati dengan kondisi cuaca',
        };
    }
  }
}
