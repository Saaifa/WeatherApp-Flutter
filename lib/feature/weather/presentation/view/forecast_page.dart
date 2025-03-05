import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/feature/search/presentation/widgets/weather_card.dart';

import '../../../../core/colors/app_colors.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {

  List<Map<String, dynamic>> dailyForecast = [
    {
      "icon":"assets/svg/rainyday_light.svg", "time" : "14:00", "temp" :"32°C", "color": AppColors.lightBlue
    },
    {
      "icon":"assets/svg/night_Lightning.svg", "time" : "15:00", "temp" :"30°C", "color": AppColors.inputTextFieldColor,
    },
    {
      "icon":"assets/svg/cloudy.svg", "time" : "16:00", "temp" :"45°C", "color": AppColors.inputTextFieldColor,
    },
    {
      "icon":"assets/svg/sunny.svg", "time" : "14:00", "temp" :"34°C", "color": AppColors.inputTextFieldColor,
    },
    {
      "icon":"assets/svg/Cloudy_Lightning_Rain_Windy.svg", "time" : "14:30", "temp" :"27°C", "color": AppColors.inputTextFieldColor,
    },
  ];


  List<Map<String, dynamic>> weeklyDataList = [
    {
      "day":"Friday", "date": "May,28", "temp": "32°C", "icon":"assets/svg/cloudy.svg"
    },
    {
      "day":"Saturday", "date": "May,29", "temp": "33°C", "icon":"assets/svg/rainyday_light.svg"
    },
    {
      "day":"Sunday", "date": "May,30", "temp": "36°C", "icon":"assets/svg/Cloudy_Lightning_Rain_Windy.svg"
    },
    {
      "day":"Monday", "date": "May,31", "temp": "34°C", "icon":"assets/svg/night_Lightning.svg"
    },
    {
      "day":"Tuesday", "date": "June, 1", "temp": "34.8°C", "icon":"assets/svg/sunny.svg"
    },
    {
      "day":"Wednesday", "date": "June, 2", "temp": "33.5°C", "icon":"assets/svg/sunny.svg"
    }
  ];


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child){
          return Scaffold(
            body: Container(
              width: double.infinity,
              // height: double.infinity,
              color: AppColors.bgColorDark,
              padding: EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  Text("Forecast report",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                    textAlign: TextAlign.center,),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("Today",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 10.0),
                        child: Text("May 28, 2021",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 130,
                    // width: 100,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: dailyForecast.length,
                        itemBuilder: (context, index){
                        return WeatherCard(
                          cardMargin: EdgeInsets.only(right: 10.0),
                          elevation: 1.0,
                          shadowColor: Colors.white,
                          color: dailyForecast[index]["color"],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(dailyForecast[index]["icon"],
                                width: 100,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(dailyForecast[index]["time"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp
                                    ),
                                    // textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    dailyForecast[index]["temp"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0
                                    ),
                                    // textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              10.horizontalSpace
                            ],
                          ),
                        );
                        }),
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Next forecast", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      itemCount: weeklyDataList.length,
                        itemBuilder: (context,index){
                        return SizedBox(
                          height: 100,
                          child: WeatherCard(
                            cardMargin: EdgeInsets.only(top: 15.0),
                            color: AppColors.inputTextFieldColor,
                            elevation: 1.0,
                            shadowColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(weeklyDataList[index]["day"],
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 18.0)
                                    ),
                                    Text(weeklyDataList[index]["date"],
                                        style: TextStyle(color: Colors.white.withOpacity(0.7),
                                            fontSize: 14.0)
                                    ),
                                  ],
                                ),
                                Text(weeklyDataList[index]["temp"], style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                ),),
                                SvgPicture.asset(weeklyDataList[index]["icon"],
                                // height: 200,
                                )
                              ]
                            ),
                          ),
                        );
                        }),
                  )
                ],
              ),
            )
          );
        },
    );
  }
}
