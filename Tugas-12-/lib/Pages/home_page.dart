import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_8/app/theme/app_assets.dart';
import 'package:tugas_8/app/theme/app_color.dart';
import 'package:tugas_8/custom/widget/custom_box_image.dart';
import 'package:tugas_8/model/news_model.dart';
import 'package:tugas_8/Pages/news_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; 

  static List<Widget> _pages = <Widget>[
    HomeContentPage(), 
    SearchPage(), 
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBoxImage(
              urlImage: AppAssets.menu,
              width: 40,
              height: 40,
            ),
            Text(
              'NewsApp',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 40),
          ],
        ),
      ),
      body: _pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Warna item yang dipilih
        unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
        onTap: _onItemTapped, // Panggil fungsi untuk mengubah tab
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 311,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => CustomBoxImage(
              margin: EdgeInsets.only(top: 32, left: index == 0 ? 30 : 0),
              padding: EdgeInsets.all(24),
              urlImage: AppAssets.imageNews,
              width: 311,
              height: 311,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TECHNOLOGY',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '3 min ago',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'Microsoft launches a deepfake detector tool ahead of US election',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          CustomBoxImage(
                            urlImage: AppAssets.chatIcon,
                            width: 20,
                            height: 20,
                          ),
                          CustomBoxImage(
                            margin: EdgeInsets.only(left: 24),
                            urlImage: AppAssets.saveIcon,
                            width: 20,
                            height: 20,
                          ),
                          Spacer(),
                          CustomBoxImage(
                            urlImage: AppAssets.shareIcon,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.grey,
              )
            ],
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.only(left: 30, right: 30),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: news.length,
            itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: 23,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomBoxImage(
                          urlImage: news[index].url,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news[index].title,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: greyColor.withOpacity(0.48)),
                              ),
                              Text(
                                news[index].subTitle,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ))
      ],
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Placeholder page untuk Setting Tab
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Pusatkan teks dan tombol di tengah layar
        children: [
          Text(
            'Setting Page',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20), // Jarak antara tulisan dan tombol
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NewsPage()),
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
