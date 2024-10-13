import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_8/app/theme/app_assets.dart';
import 'package:tugas_8/custom/widget/custom_box_image.dart';

class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),  
              bottomRight: Radius.circular(40),
            ),
            child: CustomBoxImage(
              urlImage: AppAssets.detailPage,  
              width: double.infinity,
              height: 447,  
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () {
                  
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 470.0),  
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/Images/Avatar.png'),
                      radius: 25,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Samuel Newton',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                          'TECHNOLOGY',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                Text(
                  'To build responsibly, tech needs to do more than just hire chief ethics officers',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '17 June, 2023 — 4:49 PM',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '''In the last couple of years, we've seen new teams in tech companies emerge that focus on responsible innovation, digital well-being, AI ethics or humane use. Whatever their titles, these individuals are given the task of "leading" ethics at companies, a role that often spans tech, design, and legal. While these roles are important, there's growing recognition that having a chief ethics officer or an ethics team isn't enough on its own. Instead, building technology responsibly should be embedded in the entire process from research and design to development, testing, and deployment. More often than not, ethical considerations are left until the last moment in product development, which can lead to unintended consequences once products are released into the real world. We need to rethink how we approach ethics in the tech industry.''',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
