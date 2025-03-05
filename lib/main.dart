import 'package:flutter/material.dart';
import 'package:weather_app/core/navigation/app_router.dart';
import 'package:weather_app/feature/search/presentation/view/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: AppRouter().router,
    );
  }
}

