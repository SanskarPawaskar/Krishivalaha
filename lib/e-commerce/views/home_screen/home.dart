import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/controllers/home_controller.dart';
import 'package:communityapp/e-commerce/views/cart_screen/cart_screen.dart';
import 'package:communityapp/e-commerce/views/home_screen/home_screen.dart';
import 'package:communityapp/e-commerce/views/profile_screen/profile_screen.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


import '../category_screen/category_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account)
    ];

    var navbody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'E-commerce',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: const Color(0xff004B20),
          actions: [
            IconButton(
              onPressed: () {Navigator.pushNamed(context, '/cart');},
              icon: Image.asset(icCart, width: 26)
            ),
          ],
          // leading: IconButton(
          //   icon: const Icon(FeatherIcons.chevronLeft, size: 30, color: Colors.white),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ),
      body: const CategoryScreen(),
      
      // drawer: Drawer(),
      
    );
  }
}
