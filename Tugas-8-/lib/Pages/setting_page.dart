import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Images/menuu.png'),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Images/searchh.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsItem(
                    context,
                    title: 'Profile settings',
                    subtitle: 'Settings regarding your profile',
                    imagePath: 'assets/Images/profile_icon.png',
                    arrowPath: 'assets/Images/arrow_icon.png',
                  ),
                  _buildSettingsItem(
                    context,
                    title: 'News settings',
                    subtitle: 'Choose your favourite topics',
                    imagePath: 'assets/Images/news_icon.png',
                    arrowPath: 'assets/Images/arrow_icon.png',
                  ),
                  _buildSettingsItem(
                    context,
                    title: 'Notifications',
                    subtitle: 'When would you like to be notified',
                    imagePath: 'assets/Images/notif_icon.png',
                    arrowPath: 'assets/Images/arrow_icon.png',
                  ),
                  _buildSettingsItem(
                    context,
                    title: 'Subscriptions',
                    subtitle: 'Currently, you are in Starter Plan',
                    imagePath: 'assets/Images/sub_icon.png',
                    arrowPath: 'assets/Images/arrow_icon.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Other',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  _buildSettingsItem(
                    context,
                    title: 'Bug report',
                    subtitle: 'Report bugs very easy',
                    imagePath: 'assets/Images/bug_icon.png',
                    arrowPath: 'assets/Images/arrow_icon.png',
                  ),
                  _buildSettingsItem(
                    context,
                    title: 'Share the app',
                    subtitle: 'Share on social media networks',
                    imagePath: 'assets/Images/share_icon.png',
                    arrowPath: 'assets/Images/arrow_icon.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required String title, required String subtitle, required String imagePath, required String arrowPath}) {
    return ListTile(
      leading: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), 
          color: Colors.grey[200], 
        ),
        child: Image.asset(imagePath),
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey),
      ),
      trailing: Image.asset(
        arrowPath,
        height: 16,
        width: 16,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
