import 'package:flutter/material.dart';
import 'package:tugas_8/Pages/home_page.dart';
import 'package:tugas_8/Pages/login.dart';
import 'package:tugas_8/Pages/register_page.dart';
import 'package:tugas_8/Pages/setting_page.dart';
import 'Pages/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginPage(),
      );
    }
  }