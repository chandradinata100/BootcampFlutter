import 'package:tugas_8/app/theme/app_assets.dart';

class NewsModel {
  final String url;
  final String title;
  final String subTitle;

  NewsModel({required this.url, required this.title, required this.subTitle});
}

List<NewsModel> news = [
  NewsModel(url: AppAssets.news2, title: 'TECHNOLOGY', subTitle: 'Insurtech startup PasarPolis gets \$54 million — Series B'),
  NewsModel(url: AppAssets.news3, title: 'TECHNOLOGY', subTitle: 'The IPO parade continues as Wish files, Bumble targets'),
  NewsModel(url: AppAssets.news4, title: 'TECHNOLOGY', subTitle: 'Hypatos gets \$11.8M for a deep learning approach'),
];