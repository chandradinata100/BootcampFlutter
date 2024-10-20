import 'package:finalprojectflut_cli/app/modules/weather/controllers/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());

    return Scaffold(
      backgroundColor: const Color(0xFFEDFDFF),
      body: SafeArea(
        child: Center(
          child: Obx(() {
            if (weatherController.isLoading.value) {
              return const CircularProgressIndicator();
            } else if (weatherController.errorMessage.isNotEmpty) {
              return Text(
                weatherController.errorMessage.value,
                style: GoogleFonts.montserrat(),
              );
            } else if (weatherController.weather.value == null) {
              return Text(
                "Tidak ada data cuaca",
                style: GoogleFonts.montserrat(),
              );
            } else {
              final weather = weatherController.weather.value!;
              final recommendation = weatherController.getWeatherRecommendation(weather.mainCondition);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weather.cityName,
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6151C3),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Lottie.asset(weatherController.getWeatherAnimation(weather.mainCondition)),
                  
                  Text(
                    '${weather.temperature.round()}°C',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6151C3),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    weather.mainCondition,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Color(0xFF6151C3),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Container dengan ukuran yang sama dengan HomePage
                  Container(
                    width: 350,
                    height: 335,
                    padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          recommendation['title']!,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        const SizedBox(height: 15),
                        Text(
                          recommendation['message']!,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {
                            Get.back(); // Navigasi kembali ke HomePage
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Color(0xFF000000), width: 1),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                          ),
                          child: Text(
                            'Kembali',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
