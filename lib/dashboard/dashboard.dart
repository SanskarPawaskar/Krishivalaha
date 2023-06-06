import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/dashboard/dashboard_button/dashboard_button.dart';
import 'package:communityapp/dashboard/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:communityapp/community/services/auth.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  static String temperature = "...";
  static String description = "...";

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void getAllData() async {
    AllData data = AllData();
    await data.getLocation();
    String lat = data.lat;
    String long = data.long;
    print(lat);
    print(long);
    await data.getWeatherdata(lat, long);
    print(data.currentTemp);
    print(data.desc);
    await data.setData();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  User? _user;
  String _name = '';
  String _image = 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

  Future<void> _getUser() async {
    final User? user = await _auth.currentUser;
    setState(() {
      _user = user;
    });
    if (user != null) {
      final DocumentSnapshot snapshot =
          await _db.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        setState(() {
          _name = snapshot.get('name');
          _image = snapshot.get('profileImageUrl');
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("This is Dashboard init state");
    getAllData();
    _getUser();
  }

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    double widthMq = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff004B20),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        //  backgroundColor: const Color(0xffC9E265),

        child: ListView(
          children: <Widget>[
            // const DrawerHeader(
            //   decoration: BoxDecoration(color: Color(0xffC9E265)),

            //   child:  CircleAvatar(
            //   radius:30.0,
            //   backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),

            //   ),

            // ),

            UserAccountsDrawerHeader(
              accountName: Text(
                _name,
                style: const TextStyle(fontSize: 22),
              ),
              accountEmail: Text(
                _user?.email ?? '',
                style: const TextStyle(fontSize: 15),
              ),
              decoration: const BoxDecoration(color: Color(0xff004B20)),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile',
                    arguments: FirebaseAuth.instance.currentUser!.uid);
              },
            ),
            const Divider(
              height: 1.0,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('My Orders'),
              onTap: () {
                Navigator.pushNamed(context, '/myorders',
                    arguments: FirebaseAuth.instance.currentUser!.uid);
              },
            ),
            const Divider(
              height: 1.0,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () {
                Navigator.pushNamed(context, '/cart',
                    arguments: FirebaseAuth.instance.currentUser!.uid);
              },
            ),
            const Divider(
              height: 1.0,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('whishlist'),
              onTap: () {
                Navigator.pushNamed(context, '/whislist',
                    arguments: FirebaseAuth.instance.currentUser!.uid);
              },
            ),

            const Divider(
              height: 1.0,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                _authService.signOut();
              },
            ),
            const Divider(
              height: 1.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/dashboard_blob3.png'),
            // SafeArea(
            //     child: Container(
            //         margin: EdgeInsets.fromLTRB(widthMq * 0.85, 0, 0, 0),
            //         child: const IconButton(
            //           icon: Icon(FeatherIcons.user,
            //               size: 30, color: Color(0xff004B20)),
            //           onPressed: null,
            //         ))),
            // SafeArea(
            //     child: Container(
            //         margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            //         child: const IconButton(
            //           icon: Icon(
            //             FeatherIcons.menu,
            //             size: 30,
            //             color: Color(0xff004B20),
            //           ),
            //           onPressed: null,
            //         ))),

            Container(
              margin: const EdgeInsets.fromLTRB(50, 85, 0, 0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "${Dashboard.temperature}°C",
                        style: const TextStyle(
                          fontSize: 46,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff004B20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 104,
                          child: Text(
                            Dashboard.description,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(181, 220, 0, 0),
                child: Image.asset('assets/images/plant.png')),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              margin: const EdgeInsets.only(top: 304),
              width: widthMq,
              height: 750,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  //Main Content with icons
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF1FFBA),
                          border: Border.all(color: const Color(0xff004B20)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      width: 302,
                      height: 600,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 32, 20, 32),
                        child: Column(
                          children: [
                            //First Row
                            Row(
                              children: [
                                //Weather Page Button
                                DashbordButton('weather', '/weather',
                                    'assets/images/dashboardimages/weather.png'),
                                //APMC button
                                DashbordButton('APMC\nMandi', '/apmc',
                                    'assets/images/fruit-shop.png'),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            //Second Row
                            Row(
                              children: [
                                //Community Button
                                DashbordButton('community', '/community',
                                    'assets/images/dashboardimages/community.png'),
                                //News Button
                                DashbordButton('News', '/news',
                                    'assets/images/dashboardimages/news.png')
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            //Third Row
                            Row(
                              children: [
                                //Soil Testing Button
                                DashbordButton('Soil Testing', '/soiltesting',
                                    'assets/images/dashboardimages/soil.png'),
                                //Equipment renting
                                DashbordButton('E-commerce', '/category',
                                    'assets/images/dashboardimages/e-commerce.png')
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
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
    );
  }
}
