import 'dart:io';

import 'package:communityapp/cropcare/button_style/button_style.dart';
import 'package:flutter/material.dart';
import 'disease_detection.dart';
import 'pest_detection.dart';

class Harvesting extends StatefulWidget {
  const Harvesting({super.key});

  @override
  State<Harvesting> createState() => _HarvestingState();
}

class _HarvestingState extends State<Harvesting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: 318,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffF1FFBA),
                    border: Border.all(
                      color: const Color(0xff004B20),
                    )),
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Center(child: DiseaseResult());
                      }));
                    },
                    child: Container(
                        width: 253,
                        height: 109,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(5, 4),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Plant Disease \nDetection",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff004B20),
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Center(child: PestDetection());
                      }));
                    },
                    child: Container(
                        width: 253,
                        height: 109,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(5, 4),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Pest \nDetection",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff004B20),
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ]),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/dashboardimages/bottom_logo.png'),
                  SizedBox(width: 15),
                  Text("Krishivalah",
                      style: TextStyle(
                        height: 1,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                        fontSize: 40,
                        color: Color(0xff004B20),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
