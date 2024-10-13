import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_8/Pages/home_page.dart';
import 'package:tugas_8/Pages/register_page.dart';
import 'package:tugas_8/app/theme/app_color.dart';
import 'package:tugas_8/custom/button/custombutton.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [Container(
              margin: EdgeInsets.only(top: 86,),
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/Images/news_image.png'))
              ),
            ),
            SizedBox(height: 37,),
            Text('Yuk, Membaca Bersama\nSanber News', 
            style: GoogleFonts.arimo(fontWeight: FontWeight.bold, fontSize: 21), 
            textAlign: TextAlign.center,),
          
            SizedBox(height: 21,),
            Text('Berita Terpercaya, Di Ujung Jari Anda', 
            style: TextStyle(fontSize: 15),
            ),
            Spacer(),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              btnColor: blueColor,
              text: 'Masuk',
            ),
            SizedBox(height: 21),
            CustomButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage()
                    ),
                  );
              },
              style: GoogleFonts.arimo(color: blueColor),
              btnColor: whiteColor,
              text: 'Mendaftar',
              side: BorderSide(color: blueColor, width: 1.5),
            ),
            ],
          ),
        ),
      ),
    );
  }
}