import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class WeatherPage extends StatefulWidget {
  static String route = "weatherPage";
  static late String temp;
  static late String description;
  static late String cityName;
  static late String windSpeed;
  static late String humidity;
  static late String pressure;
  static late String icon;

  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    //Media query for width and height
    String icon = WeatherPage.icon;
    double width_mq = MediaQuery.of(context).size.width;
    double height_mq = MediaQuery.of(context).size.height;
//Hourly weather display widget builder
    Widget buildHourlyWeather() => Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
        width: width_mq * 0.208,
        height: height_mq * 0.120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(5, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                '24°C',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Image.asset(
              'assets/images/weatherimages/sample_icon.png',
              width: 32.63,
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text('1 PM',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
            )
          ],
        ));
    Widget dailyWeatherUpdate() => Container(
          margin: EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
          width: width_mq * 0.728,
          height: height_mq * 0.0617,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      'Wednesday',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/weatherimages/sample_icon.png',
                    width: width_mq * 0.088,
                    height: height_mq * 0.04,
                  ),
                  Text(
                    '22°C/24°C',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              Container(
                width: width_mq * 0.66,
                height: 1,
                color: Colors.black,
                child: null,
              )
            ],
          ),
        );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: Color(0xff004B20),
          leading: IconButton(
            icon: const Icon(FeatherIcons.chevronLeft, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: width_mq,
                height: height_mq * 1.57,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0, height_mq * 0.05, 0, height_mq * 0.05),
                      decoration: BoxDecoration(
                          color: Color(0xffF1FFBA),
                          border: Border.all(
                            color: Color(0xff004B20),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: width_mq * 0.882,
                      height: height_mq * 1.5,
                      child: Column(children: [
                        //Main Temperature with icon
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(5, 4),
                                )
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          margin: EdgeInsets.fromLTRB(0, 35, 0, 20),
                          height: height_mq * 0.4,
                          width: width_mq * 0.784,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: Image.network(
                                    "http://openweathermap.org/img/wn/$icon@2x.png",
                                  ),
                                ),
                              ),
                              Text(
                                WeatherPage.temp + '°C',
                                style: TextStyle(
                                  fontSize: 46,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff004B20),
                                ),
                              ),
                              Text(
                                WeatherPage.description,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xff004B20),
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                WeatherPage.cityName,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xff004B20),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        //wind hunidity and pressure
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(5, 4),
                                )
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: width_mq * 0.784,
                          height: height_mq * 0.102,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Wind',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(
                                        WeatherPage.windSpeed + ' m/s',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Humidity',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        WeatherPage.humidity + '%',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Pressure',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        WeatherPage.pressure + 'hPa',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Hourly weather update
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          width: width_mq * 0.784,
                          height: height_mq * 0.140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildHourlyWeather(),
                              buildHourlyWeather(),
                              buildHourlyWeather(),
                              buildHourlyWeather(),
                              buildHourlyWeather()
                            ],
                          ),
                        ),
                        //Daily weather section
                        Container(
                          width: width_mq * 0.784,
                          height: height_mq * 0.68,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(5, 4),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              dailyWeatherUpdate(),
                              dailyWeatherUpdate(),
                              dailyWeatherUpdate(),
                              dailyWeatherUpdate(),
                              dailyWeatherUpdate(),
                              dailyWeatherUpdate(),
                              dailyWeatherUpdate(),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            'assets/images/dashboardimages/bottom_logo.png'),
                        const SizedBox(width: 15),
                        const Text("Krishivalah",
                            style: TextStyle(
                              height: 1,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w400,
                              fontSize: 40,
                              color: Color(0xff004B20),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}