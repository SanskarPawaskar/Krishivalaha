import 'dart:convert';
import 'dart:io';
import 'package:communityapp/cropcare/api_key.dart';
import 'package:communityapp/cropcare/disese_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DiseaseResult extends StatefulWidget {
  const DiseaseResult({Key? key}) : super(key: key);

  @override
  State<DiseaseResult> createState() => _DiseaseResultState();
}

class _DiseaseResultState extends State<DiseaseResult> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  late List<int> imageBytes;
  late File imageFile;

  var resJson;

  onUploadImage(File selectedImage, dynamic cropName) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$key/disease"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split('/').last,
      ),
    );
    request.files.add(
      http.MultipartFile(
        'crop',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: cropName,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    print(response.statusCode);
    setState(() {
      resJson = jsonDecode(response.body);
    });
    return resJson;
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, maxWidth: 400, maxHeight: 400);
      if (image == null) return;
      // final imageTemp = File(image.path);
      setState(() => this.image = image);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromPhone() async {
    try {
      final image = await picker.pickImage(
          source: ImageSource.gallery, maxWidth: 400, maxHeight: 400);
      if (image == null) return;
      // final imageTemp = File(image.path);
      setState(() => this.image = image);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<dynamic>? _futureAlbum;
  dynamic _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Disease Detection',
            style: TextStyle(color: Colors.white, fontSize: 22),
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
        body: Container(
          child: (_futureAlbum == null) ? diseasePage() : buildFutureBuilder(),
        ));
  }

  SingleChildScrollView diseasePage() {
    return SingleChildScrollView(
        child: Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        width: 318,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffF1FFBA),
            border: Border.all(
              color: Color(0xff004B20),
            )),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    FeatherIcons.upload,
                    size: 40,
                    color: Color(0xff004B20),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Upload Image",
                      style: TextStyle(
                        height: 1,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        color: Color(0xff004B20),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: DropdownButton(
                style: const TextStyle(color: Colors.black),
                hint: _dropDownValue == null
                    ? const Text('Select Crop')
                    : Text(
                        _dropDownValue,
                        style: const TextStyle(color: Colors.blue),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                items: ['potato', 'tomato', 'corn'].map(
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
                      _dropDownValue = val;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

            TextButton(
              onPressed: () {
                pickImageFromCamera();
              },
              child: Container(
                  width: 253,
                  height: 90,
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
                      "From Camera",
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
              height: 20,
            ),
            TextButton(
              onPressed: () {
                pickImageFromPhone();
              },
              child: Container(
                  width: 253,
                  height: 90,
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
                      "From Gallery",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff004B20),
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                // Only one of the children will be shown based on `beforeSunset` condition
                if (image == null) ...[
                  Container(),
                ] else ...[
                  Image.file(File(image!.path)),
                  // imageFile = File(image!.path),
                  // imageBytes = image?.readAsBytesSync(),
                  MaterialButton(
                      color: Color(0xff004B20),
                      child: const Text("Predict",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        setState(() {
                          _futureAlbum =
                              onUploadImage(File(image!.path), _dropDownValue);
                        });
                      }),
                ],
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //  Container(
            //   child: image == null?Container():Image.file(File(image!.path)),
            // ),
          ],
        ),
      ),
    ));
  }

  FutureBuilder<dynamic> buildFutureBuilder() {
    return FutureBuilder<dynamic>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DiseasePredictionResult(snapshot);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
