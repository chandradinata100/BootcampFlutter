import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tugas_8/Pages/home_page.dart';
import 'package:tugas_8/Pages/news_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: 'news-page', page: () => NewsPage()),
    GetPage(name: 'home-page', page: () => HomePage()),
  ];
}