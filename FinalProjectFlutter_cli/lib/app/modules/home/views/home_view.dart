import 'package:finalprojectflut_cli/app/modules/bottomtab/bottomtab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Images/BackGround.png'), // Sesuaikan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten di atas background
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Obx(() {
                return controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : Container(
                        width: 350, // Lebar kontainer
                        height: 335, // Tinggi kontainer
                        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Cek Cuaca Di Daerah-mu!',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Text(
                              'Kami akan langsung memberi tahu bagaimana cuaca dan suhu di daerah-mu',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: controller.startLoading,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlueAccent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.lightBlueAccent, width: 2),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                              ),
                              child: Text(
                                'Mulai!',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
