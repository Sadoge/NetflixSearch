import 'package:flutter/material.dart';

import 'common/app_colors.dart';
import 'presentation/home/home_page.dart';

class NetflixSearchApp extends StatelessWidget {
  const NetflixSearchApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteRock,
        primarySwatch: getMaterialColor(AppColors.codGrey),
        primaryColor: AppColors.maroon,
        accentColor: AppColors.codGrey,
      ),
      home: HomePage(),
    );
  }
}
