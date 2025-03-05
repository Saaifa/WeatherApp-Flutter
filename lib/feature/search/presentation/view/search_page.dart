import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/colors/app_colors.dart';
import 'package:weather_app/core/common/input_text_field.dart';
import 'package:weather_app/core/navigation/route_constants.dart';
import 'package:weather_app/feature/search/presentation/widgets/weather_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
   List<Map<String, dynamic>> weatherData = [
     {"temp": "32°", "condition": "Cloudy", "location": "California", "color": AppColors.lightBlue, "icon": "assets/svg/cloudy.svg"},
     {"temp": "28°", "condition": "Lightning", "location": "Paris", "color": AppColors.inputTextFieldColor, "icon": "assets/svg/night_Lightning.svg"},
     {"temp": "24°", "condition": "Storm", "location": "London", "color": AppColors.inputTextFieldColor, "icon": "assets/svg/Cloudy_Lightning_Rain_Windy.svg"},
     {"temp": "33°", "condition": "Bright", "location": "Milan", "color": AppColors.inputTextFieldColor, "icon": "assets/svg/sunny.svg"},
   ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          // height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 70.0),
            color: AppColors.bgColorDark,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Pick Location",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Find the area or city that you want to know \n   the detailed weather info at this time",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        // color: Colors.white,
                        margin: EdgeInsets.all(8.0),
                        // width: 15.0,
                        child: InputTextField(
                          label: "Search",
                          hint: "",
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          controller: SearchController(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        height: 50.0,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.inputTextFieldColor.withOpacity(0.9),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white.withOpacity(0.9),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.0,
                ),
                Expanded(
                    child: GridView.builder(
                      itemCount: weatherData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                          childAspectRatio: 1.2
                      ),
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            context.pushNamed(RouteConstants.weatherPage);
                          },
                          child: WeatherCard(
                            elevation: 5.0,
                            color: weatherData[index]["color"],
                            shadowColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        weatherData[index]["temp"],
                                        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(weatherData[index]["condition"],
                                      style: TextStyle(color: Colors.white),),
                                      Text(weatherData[index]["location"],
                                        style: TextStyle(color: Colors.white),),
                                      SizedBox(width: 5.0,),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SvgPicture.asset(weatherData[index]["icon"],
                                      height: 55.0,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
