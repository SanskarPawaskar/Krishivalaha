import 'package:communityapp/appbar.dart';
import 'package:communityapp/cropcare/post_harvesting.dart';
import 'package:communityapp/cropcare/pre_harvesting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'button_style/button_style.dart';
import 'harvesting.dart';

class Crop extends StatefulWidget {
  const Crop({super.key});

  @override
  State<Crop> createState() => _CropState();
}

class _CropState extends State<Crop> {
  @override
  Widget build(BuildContext context) {
    return MyBody();
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Crop Care',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: const Color(0xff004B20),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
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
                        return Scaffold(
                            appBar: AppBar(
                              title: const Text(
                                'PreHarvesting',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              backgroundColor: const Color(0xff004B20),
                              leading: IconButton(
                                icon: const Icon(FeatherIcons.chevronLeft,
                                    size: 30, color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            body: const Center(child: PreHarvesting()));
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
                              offset: const Offset(5, 4),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Pre-Harvesting",
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
                        return Scaffold(
                            appBar: AppBar(
                              title: const Text(
                                'Harvesting',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              backgroundColor: Color(0xff004B20),
                              leading: IconButton(
                                icon: const Icon(FeatherIcons.chevronLeft,
                                    size: 30, color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            body: const Center(child: Harvesting()));
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
                              offset: const Offset(5, 4),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Harvesting",
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
                        return Scaffold(
                            appBar: AppBar(
                              title: const Text(
                                'PostHarvesting',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              backgroundColor: const Color(0xff004B20),
                              leading: IconButton(
                                icon: const Icon(FeatherIcons.chevronLeft,
                                    size: 30, color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            body: const Center(child: PostHarvesting()));
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
                        child: Center(
                          child: Text(
                            "Post-Harvesting",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff004B20),
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/dashboardimages/bottom_logo.png'),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}


// Navigator.push(
//                        context, MaterialPageRoute(
//                          builder: (context) {
//                           return Scaffold(
//                             appBar: Header('Harvesting').getAppbar,
//                             body: const Center(
//                               child:Harvesting()
//                             )
//                           );
//                         }
//                       )
//                     );