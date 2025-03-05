import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/navigation/route_constants.dart';
import 'package:weather_app/feature/search/presentation/view/search_page.dart';
import 'package:weather_app/feature/weather/presentation/view/forecast_page.dart';
import 'package:weather_app/feature/weather/presentation/view/weather_page.dart';

const String searchPath = "/search";
const String weatherPath = "/weather";
const String forecastPath = "/forecast";

class AppRouter {
  GoRouter router = GoRouter(
      initialLocation: searchPath, routes: [
    GoRoute(
        name: RouteConstants.searchPage,
        path: searchPath,
        pageBuilder: (context, state) => MaterialPage(child: SearchPage())),
    GoRoute(
        name: RouteConstants.weatherPage,
        path: weatherPath,
        pageBuilder: (context, state) => MaterialPage(child: WeatherPage())),
    GoRoute(
        name: RouteConstants.forecastPage,
        path: forecastPath,
        pageBuilder: (context, state) => MaterialPage(child: ForecastPage())),
  ]);
}
