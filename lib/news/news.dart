import 'dart:developer';

import 'package:communityapp/news/category.dart';
import 'package:communityapp/news/model.dart';
import 'package:communityapp/news/newsview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NewsPage extends StatefulWidget {
  static String route = "newsPage";
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  List<NewsQueryModel> newsModelListCarousel = <NewsQueryModel>[];
  List<String> navBarItems = [
    "Top News",
    "India",
    "Goverment Policies", //https://newsapi.org/v2/everything?q=farming+policies+india&apiKey=ed87f846339f40569b4527126aed153f
    "Technology", //https://newsapi.org/v2/everything?q=farming+technology+india&apiKey=ed87f846339f40569b4527126aed153f
    "Weather", //https://newsapi.org/v2/everything?q=india+weather+farming&apiKey=ed87f846339f40569b4527126aed153f
    "Markets" //https://newsapi.org/v2/everything?q=india+apmc&apiKey=ed87f846339f40569b4527126aed153f
  ];
  bool isLoading = true;
  bool isLoadingScroll = true;
  getNewsByQuery(String query) async {
    Map element;
    int i = 0;
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=ed87f846339f40569b4527126aed153f";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    if (data['status'] == "ok") {
      for (element in data['articles']) {
        try {
          i++;
          if (element['urlToImage'] != null && element['description'] != null) {
            NewsQueryModel newsQueryModel = new NewsQueryModel();
            newsQueryModel = NewsQueryModel.fromMap(element);
            newsModelList.add(newsQueryModel);

            setState(() {
              isLoadingScroll = false;
            });
            if (i == 6) {
              break;
            }
          }
        } catch (e) {
          print(e);
        }
        ;
      }
      ;
    }
  }

  getNewsByCountry() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=ed87f846339f40569b4527126aed153f";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    if (data['status'] == "ok") {
      data["articles"].forEach((element) {
        try {
          if (element['urlToImage'] != null && element['description'] != null) {
            NewsQueryModel newsQueryModel = new NewsQueryModel();
            newsQueryModel = NewsQueryModel.fromMap(element);
            newsModelListCarousel.add(newsQueryModel);
            setState(() {
              isLoading = false;
            });
          }
        } catch (e) {
          print(e);
        }
        ;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery("india");
    getNewsByCountry();
  }

  Widget build(BuildContext context) {
    double width_mq = MediaQuery.of(context).size.width;
    double height_mq = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
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
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            //Nav Bar
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: navBarItems.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryNews(Query: navBarItems[index])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffEEFABE),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              color: Color(0xff004B20),
                              width: 2,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 7.5, vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Center(
                            child: Text(navBarItems[index],
                                style: TextStyle(
                                  color: Color(0xff004B20),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      );
                    })),
            SizedBox(
              height: 15,
            ),
            //Sliding Carousel
            Container(
              child: isLoading
                  ? Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()))
                  : CarouselSlider(
                      options: CarouselOptions(
                          height: 200, autoPlay: true, enlargeCenterPage: true),
                      items: newsModelListCarousel.map((instace) {
                        return Builder(builder: (BuildContext context) {
                          try {
                            return Container(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewsView(instace.newsUrl)));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          instace.newsImg,
                                          height: double.infinity,
                                          fit: BoxFit.fill,
                                          width: 300,
                                        ),
                                      ),
                                      Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.black12
                                                        .withOpacity(0),
                                                    Colors.black
                                                  ],
                                                )),
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  15, 15, 15, 5),
                                              child: Text(
                                                instace.newsHead,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } catch (e) {
                            print(e);
                            return Container();
                          }
                          ;
                        });
                      }).toList()),
            ),
            //Scrollable News Builder
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: const Text(
                          "Latest News",
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  isLoadingScroll
                      ? SizedBox(
                          height: height_mq - 350,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // itemCount: 6,
                          itemCount: newsModelList.length,
                          itemBuilder: (context, index) {
                            try {
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    margin: const EdgeInsets.symmetric(
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
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Colors.black12
                                                              .withOpacity(0),
                                                          Colors.black
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter)),
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      15, 15, 10, 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        newsModelList[index]
                                                                    .newsHead
                                                                    .length >
                                                                100
                                                            ? "${newsModelList[index].newsHead.substring(0, 80)}...."
                                                            : newsModelList[
                                                                    index]
                                                                .newsHead,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        newsModelList[index]
                                                                    .newsDes
                                                                    .length >
                                                                50
                                                            ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                                            : newsModelList[
                                                                    index]
                                                                .newsDes,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
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
                            } catch (e) {
                              print(e);
                              return Container();
                            }
                          }),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: const Color(0xff004B20)),
                            onPressed: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryNews(Query: "Top News")));
                            }),
                            child: const Text(
                              "Show More",
                              style: TextStyle(fontSize: 18),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
