import 'dart:convert';

import 'package:communityapp/cropcare/api_key.dart';
import 'package:communityapp/cropcare/crop_yeild_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

dynamic createAlbum(String area, String yeild, String soil, String district,
    String crop, String season) async {
  final response = await http.post(
    Uri.parse('$key/yeild'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'area': area,
      'yeild': yeild,
      'crop': crop,
      'district': district,
      'season': season,
      'soil': soil
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String area;
  final String yeild;

  final String soil;
  final String district;
  final String crop;
  final String season;

  const Album(
      {required this.area,
      required this.yeild,
      required this.crop,
      required this.district,
      required this.season,
      required this.soil});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        area: json['area'],
        yeild: json['yeild'],
        crop: json['crop'],
        district: json['district'],
        season: json['season'],
        soil: json['soil']);
  }
}

class CropYeil extends StatefulWidget {
  const CropYeil({Key? key}) : super(key: key);

  @override
  State<CropYeil> createState() => _CropYeilState();
}

class _CropYeilState extends State<CropYeil> {
  dynamic _futureAlbum;
  dynamic _dropSoilValue;
  dynamic _dropDistrictValue;
  dynamic _dropCropValue;
  dynamic _dropSeasonValue;
  final List<TextEditingController> _controller =
      List.generate(7, (i) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Padding buildColumn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _controller[0],
            decoration: const InputDecoration(hintText: 'Area'),
          ),
          TextField(
            controller: _controller[1],
            decoration: const InputDecoration(hintText: 'Yield'),
          ),
          // TextField(
          //   controller: _controller[2],
          //   decoration: const InputDecoration(hintText: 'Temperature'),
          // ),
          // TextField(
          //   controller: _controller[3],
          //   decoration: const InputDecoration(hintText: 'Precipitaion'),
          // ),
          // TextField(
          //   controller: _controller[4],
          //   decoration: const InputDecoration(hintText: 'Humidity'),
          // ),
          SizedBox(
            child: DropdownButton(
              hint: _dropSoilValue == null
                  ? const Text('Soil Type')
                  : Text(
                      _dropSoilValue,
                      style: const TextStyle(color: Colors.blue),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Colors.blue),
              items: [
                'chalky',
                'clay',
                'loamy',
                'peaty',
                'sandy',
                'silt',
                'silty'
              ].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {
                    _dropSoilValue = val;
                  },
                );
              },
            ),
          ),
          SizedBox(
            child: DropdownButton(
              hint: _dropDistrictValue == null
                  ? const Text('District')
                  : Text(
                      _dropDistrictValue,
                      style: const TextStyle(color: Colors.blue),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Colors.blue),
              items: [
                'AHMEDNAGAR',
                'AKOLA',
                'AMRAVATI',
                'AURANGABAD',
                'BEED',
                'BHANDARA',
                'BULDHANA',
                'CHANDRAPUR',
                'DHULE',
                'GADCHIROLI',
                'GONDIA',
                'HINGOLI',
                'JALGAON',
                'JALNA',
                'KOLHAPUR',
                'LATUR',
                'NAGPUR',
                'NANDED',
                'NANDURBAR',
                'NASHIK',
                'OSMANABAD',
                'PARBHANI',
                'PUNE',
                'SANGLI',
                'SATARA',
                'SOLAPUR',
                'THANE',
                'WARDHA',
                'WASHIM',
                'YAVATMAL',
              ].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {
                    _dropDistrictValue = val;
                  },
                );
              },
            ),
          ),
          SizedBox(
            child: DropdownButton(
              hint: _dropCropValue == null
                  ? const Text('Crop')
                  : Text(
                      _dropCropValue,
                      style: const TextStyle(color: Colors.blue),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Colors.blue),
              items: ['Bajra', 'Jowar', 'Wheat'].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {
                    _dropCropValue = val;
                  },
                );
              },
            ),
          ),
          SizedBox(
            child: DropdownButton(
              hint: _dropSeasonValue == null
                  ? const Text('Season')
                  : Text(
                      _dropSeasonValue,
                      style: const TextStyle(color: Colors.blue),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Colors.blue),
              items: ['Season:_Kharif', 'Season:_Rabi', 'Season:_Rabi'].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {
                    _dropSeasonValue = val;
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _futureAlbum = createAlbum(
                    _controller[0].text,
                    _controller[1].text,
                    // _controller[2].text,
                    // _controller[3].text,
                    // _controller[4].text,
                    _dropSoilValue,
                    _dropDistrictValue,
                    _dropCropValue,
                    _dropSeasonValue);
              });
            },
            style: ElevatedButton.styleFrom(primary: Colors.green.shade900),
            child: const Text('Predict'),
          ),
        ],
      ),
    );
  }

  FutureBuilder<dynamic> buildFutureBuilder() {
    return FutureBuilder<dynamic>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // return Scaffold(body: Text(snapshot.data['key'].toString()));
          return PostHarvestingResult(snapshot, _controller[1].text);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
