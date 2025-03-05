import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/colors/app_colors.dart';
import 'package:weather_app/core/navigation/route_constants.dart';

import '../../../search/presentation/widgets/weather_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<Map<String, dynamic>> weatherList = [
    {
      "icon":"assets/svg/rainyday_light.svg", "time" : "14:00", "temp" :"32°C", "color": AppColors.lightBlue,
    },
    {
      "icon":"assets/svg/cloudy.svg", "time" : "15:00", "temp" :"30°C", "color": AppColors.inputTextFieldColor,
    },
    {
      "icon":"assets/svg/night_Lightning.svg", "time" : "16:00", "temp" :"45°C",  "color": AppColors.inputTextFieldColor,
    },
    {
      "icon":"assets/svg/sunny.svg", "time" : "14:00", "temp" :"34°C",  "color": AppColors.inputTextFieldColor,
    },
    {
      "icon":"assets/svg/Cloudy_Lightning_Rain_Windy.svg", "time" : "14:30", "temp" :"27°C",  "color": AppColors.inputTextFieldColor,
    },

  ];



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          body: Container(
            // margin: EdgeInsets.all(10.0),
            width: double.infinity,
            padding: EdgeInsets.only(top: 70.0),
            color: AppColors.bgColorDark,
            child:Column(
              children: [
                Text(
                  "California",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "May 28, 2021",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                Center(
                  child: SvgPicture.asset(
                    "assets/svg/rainyday_light.svg",
                    // height: 500,
                    width: 350,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Temp",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                        Text("32°",
                          style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),)
                ]
                    ),
                    Column(
                        children: [
                          Text("Wind",
                            style: TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          Text("10km/h",
                            style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ]
                    ),
                    Column(
                        children: [
                          Text("Humidity",
                            style: TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          Text("75%",
                            style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ]
                    )
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Today",
                        style: TextStyle(color: Colors.white, fontSize: 16.0,),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: TextButton(
                        onPressed: (){
                          context.pushNamed(RouteConstants.forecastPage);
                        },
                        child: Text(
                          "View full report",
                          style: TextStyle(color: AppColors.lightBlue, fontSize: 16.0,),
                        ),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Container(
                  height: 120.h,

                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 50.h, left: 7.h, right: 7.h),
                    scrollDirection: Axis.horizontal,
                    itemCount: weatherList.length,
                      itemBuilder: (context, index){
                      return SizedBox(
                        width: 170.w,
                        // height: 50.0,
                        child: WeatherCard(
                          elevation: 1.0,
                          shadowColor: Colors.white,
                          color: weatherList[index]["color"],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(weatherList[index]["icon"],
                                width: 100,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(weatherList[index]["time"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp
                                  ),
                                  // textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    weatherList[index]["temp"],
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
                        ),
                      );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
