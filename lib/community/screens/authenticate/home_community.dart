import 'package:communityapp/community/screens/home/feed.dart';
import 'package:communityapp/community/screens/home/search.dart';
import 'package:communityapp/community/services/auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  int _currentIndex = 0;
  final List<Widget> _children = [const Feed(), const Search()];

  void onTabPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Community',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: Color(0xff004B20),
          leading: IconButton(
            icon: const Icon(FeatherIcons.chevronLeft,
                size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff004B20),
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: const Icon(Icons.add)),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       const DrawerHeader(
      //         decoration: BoxDecoration(color: Colors.white),
      //         child:  Text('drawer header'),
      //       ),
      //       ListTile(
      //         title: const Text('Profile'),
      //         onTap: () {
      //           Navigator.pushNamed(context, '/profile',
      //               arguments: FirebaseAuth.instance.currentUser?.uid);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Logout'),

      //         onTap: () async {
      //           _authService.signOut();
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabPressed,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xff004B20),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: 'search')
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
