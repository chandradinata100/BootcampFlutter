import 'package:finalprojectflut_cli/app/modules/bottomtab/bottomtab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_controller.dart'; 

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDFDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/Images/Avatar.png'),
                  ),
                  const SizedBox(width: 20),
                  Obx(() => Text(
                        profileController.email.value,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('Settings', style: GoogleFonts.montserrat()),
                onTap: () {
                  Get.toNamed('/setting');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out', style: GoogleFonts.montserrat()),
                onTap: () {
                  profileController.logout();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
