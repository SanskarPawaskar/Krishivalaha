import 'dart:convert';

import 'package:communityapp/news/model.dart';
import 'package:communityapp/news/newsview.dart';
import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart';

class CategoryNews extends StatefulWidget {
  String Query;
  CategoryNews({Key? key, required this.Query}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];

  bool isLoading = true;
  getNewsByQuery(String query) async {
    String url = "";
    if (query == "Top News" || query == "India") {
      url =
          "https://newsapi.org/v2/top-headlines?country=in&apiKey=ed87f846339f40569b4527126aed153f";
    } else if (query == "Goverment Policies") {
      url =
          "https://newsapi.org/v2/everything?q=farming+policies+india&apiKey=ed87f846339f40569b4527126aed153";
    } else if (query == "Technology") {
      url =
          "https://newsapi.org/v2/everything?q=farming+technology+india&apiKey=ed87f846339f40569b4527126aed153f";
    } else if (query == "Weather") {
      url =
          "https://newsapi.org/v2/everything?q=india+weather+farming&apiKey=ed87f846339f40569b4527126aed153f";
    } else if (query == "Markets") {
      url =
          "https://newsapi.org/v2/everything?q=india+apmc&apiKey=ed87f846339f40569b4527126aed153f";
    } else {
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=ed87f846339f40569b4527126aed153f";
    }

    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    if (data['status'] == "ok") {
      data["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsQueryModel newsQueryModel = NewsQueryModel();
          newsQueryModel = NewsQueryModel.fromMap(element);
          newsModelList.add(newsQueryModel);
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery(widget.Query);
  }

  Widget build(BuildContext context) {
    double width_mq = MediaQuery.of(context).size.width;
    double height_mq = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      widget.Query,
                      style: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              isLoading
                  ? Container(
                      height: height_mq - 450,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: newsModelList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // Image.asset('assets/images/news.png')
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsView(
                                          newsModelList[index].newsUrl)));
                            },
                            child: Card(
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Center(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15),
                                        child: Image.network(
                                          newsModelList[index].newsImg,
                                          fit: BoxFit.fill,
                                          height: 230,
                                          width: double.infinity,
                                        )),
                                    Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black12
                                                        .withOpacity(0),
                                                    Colors.black
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment
                                                      .bottomCenter)),
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 15, 10, 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  newsModelList[index]
                                                              .newsHead
                                                              .length >
                                                          100
                                                      ? "${newsModelList[index].newsHead.substring(0, 80)}...."
                                                      : newsModelList[index]
                                                          .newsHead,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  newsModelList[index]
                                                              .newsDes
                                                              .length >
                                                          50
                                                      ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                                      : newsModelList[index]
                                                          .newsDes,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(10)),
              //               primary: Color(0xff004B20)),
              //           onPressed: (() {}),
              //           child: Text(
              //             "Show More",
              //             style: TextStyle(fontSize: 18),
              //           ))
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}