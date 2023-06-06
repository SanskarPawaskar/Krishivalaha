import 'dart:async';
import 'dart:convert';

import 'package:communityapp/cropcare/api_key.dart';
import 'package:communityapp/cropcare/crop_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(
    String first, String second, String third, String fourth) async {
  final response = await http.post(
    Uri.parse('$key/crop'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'first': first,
      'second': second,
      'third': third,
      'fourth': fourth,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String cropname;
  final dynamic links;
  final dynamic detail;

  const Album(
      {required this.cropname, required this.links, required this.detail});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      cropname: json['cropname'],
      links: json['links'],
      detail: json['detail'],
      // sev:json['sev'],
    );
  }
}

class CropDetection extends StatefulWidget {
  const CropDetection({super.key});

  @override
  State<CropDetection> createState() {
    return _CropDetectionState();
  }
}

class _CropDetectionState extends State<CropDetection> {
  final List<TextEditingController> _controller =
      List.generate(74, (i) => TextEditingController());
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'PreHarvesting',
          style: TextStyle(color: Colors.white, fontSize: 22),
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
      body: Container(
        child: (_futureAlbum == null)
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                child: buildColumn(),
              )
            : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: <Widget>[
        TextField(
          controller: _controller[0],
          decoration: const InputDecoration(hintText: 'Enter Value of N'),
        ),
        Container(height: 20),
        TextField(
          controller: _controller[1],
          decoration: const InputDecoration(hintText: 'Enter Value of P'),
        ),
        Container(height: 20),
        TextField(
          controller: _controller[2],
          decoration: const InputDecoration(hintText: 'Enter Value of K'),
        ),
        Container(height: 20),
        TextField(
          controller: _controller[3],
          decoration: const InputDecoration(hintText: 'Enter PH value'),
        ),
        Container(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(
                _controller[0].text,
                _controller[1].text,
                _controller[2].text,
                _controller[3].text,
              );
            });
          },
          style: ElevatedButton.styleFrom(primary: Colors.green.shade900),
          child: const Text('Predict'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CropPerdictionResult(snapshot);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
