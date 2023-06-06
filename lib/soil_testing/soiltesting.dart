import 'package:communityapp/soil_testing/soilview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SoilTesting extends StatefulWidget {
  static String route = "soilTesting";
  const SoilTesting({Key? key}) : super(key: key);

  @override
  State<SoilTesting> createState() => _SoilTestingState();
}

class _SoilTestingState extends State<SoilTesting> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1FFBA),
        appBar: AppBar(
          title: Text(
            'Soil Testing',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: Color(0xff004B20),
          leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              //Basic Package
              Center(
                child: Container(
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
                      borderRadius: BorderRadius.circular(20)),
                  height: 480,
                  width: 325,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff004B20),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        width: 325,
                        height: 65,
                        child: Center(
                            child: Text(
                          "Basic Package",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 24,
                          ),
                        )),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Center(
                            child: Text(
                              "Soil Sample Analysis for 6 parameter",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Text(
                          "1) PH\n2) Electrical Conductivity (EC)\n3) Organic Carbon (OC)\n4) Nitrogen (N)\n5) Phosphorus (P)\n6) Potassium (K)",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff004B20),
                                borderRadius: BorderRadius.circular(20)),
                            width: 179,
                            height: 61,
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //Premium Package
              Center(
                child: Container(
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
                      borderRadius: BorderRadius.circular(20)),
                  height: 720,
                  width: 325,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff004B20),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        width: 325,
                        height: 65,
                        child: Center(
                            child: Text(
                          "Premium Package",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 24,
                          ),
                        )),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Center(
                            child: Text(
                              "Soil Sample Analysis for 16 parameter",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Text(
                          "1) PH\n2) Electrical Conductivity (EC)\n3) Organic Carbon (OC)\n4) Nitrogen (N)\n5) Phosphorus (P)\n6) Potassium (K)\n7) Calcium (Ca)\n8) Magnesium (Mg)\n9) Sulfur (s)\n10) Zinc (Zn)\n11) Manganese (Mn)\n12) Iron (Fe)\n13) Copper (Cu)\n14) Boron (B)\n15) Soil Biology",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff004B20),
                                borderRadius: BorderRadius.circular(20)),
                            width: 179,
                            height: 61,
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
               //Goverment Testing centers
              Container(
                width: 325,
                height: 88,
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
               
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SoilView()));
                  },
                  child: const Center(
                    child: Text(
                      "Goverment Soil Testing \nCenters",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}