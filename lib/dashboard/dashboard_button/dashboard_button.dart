import 'package:flutter/material.dart';


class DashbordButton extends StatelessWidget {

  String image,name,route;
  DashbordButton(this.name,this.route,this.image,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButton(
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(5, 4),
                          )
                        ],
                        color: Color(0xff004B20),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(15))),
                    width: 114,
                    height: 145,
                    child: Column(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(top: 21),
                          child: Image.asset(
                            // 'assets/images/dashboardimages/weather_icon.png',
                            image,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          // 'Weather',
                          name,
                          style: const TextStyle(
                              height: 1,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                onPressed: () {
                  Navigator.pushNamed(
                      context, route);
                },
              );
  }
}