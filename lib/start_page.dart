import 'package:communityapp/cropcare/crop_care.dart';
import 'package:communityapp/dashboard/dashboard.dart';
import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/views/category_screen/category_screen.dart';
import 'package:communityapp/schemes/schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'community/screens/authenticate/home_community.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int navigationIndex = 0;
  final navigationPages = [
    const Dashboard(),
    const CategoryScreen(),
    const Crop(),
    const Schemes()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationPages[navigationIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: const Color(0xff1E7141),
              backgroundColor: const Color(0xff004B20),
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              )),
          child: NavigationBar(
              selectedIndex: navigationIndex,
              onDestinationSelected: (navigationIndex) =>
                  setState(() => this.navigationIndex = navigationIndex),
              destinations: const [
                NavigationDestination(
                    icon: Icon(
                      FeatherIcons.home,
                      color: Colors.white,
                    ),
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(
                      FeatherIcons.shoppingCart,
                      color: Colors.white,
                    ),
                    label: 'E-Com'),
                NavigationDestination(
                    icon: Icon(
                      FeatherIcons.feather,
                      color: Colors.white,
                    ),
                    label: 'Crop-Care'),
                NavigationDestination(
                    icon: Icon(
                      FeatherIcons.bookOpen,
                      color: Colors.white,
                    ),
                    label: 'Schemes'),
              ]),
        ));
  }
}
