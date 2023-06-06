import 'package:communityapp/apmc/apmc.dart';
import 'package:communityapp/community/screens/authenticate/handler.dart';
import 'package:communityapp/community/screens/posts/add.dart';
import 'package:communityapp/community/screens/posts/reply.dart';
import 'package:communityapp/community/screens/profile/edit.dart';
import 'package:communityapp/community/screens/profile/profile.dart';
import 'package:communityapp/cropcare/crop_care.dart';
import 'package:communityapp/dashboard/dashboard.dart';
import 'package:communityapp/e-commerce/views/cart_screen/cart_screen.dart';
import 'package:communityapp/e-commerce/views/category_screen/category_screen.dart';
import 'package:communityapp/e-commerce/views/category_screen/item_details.dart';
import 'package:communityapp/e-commerce/views/home_screen/home.dart';
import 'package:communityapp/e-commerce/views/orders_screen/orders_screen.dart';
import 'package:communityapp/e-commerce/views/whislist_screen/whislist_screen.dart';
import 'package:communityapp/news/news.dart';
import 'package:communityapp/soil_testing/soiltesting.dart';
import 'package:communityapp/start_page.dart';
import 'package:communityapp/weather/weather.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'community/models/firebase_user.dart';
import 'community/screens/authenticate/home_community.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return const Handler();
    } else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/startpage',
          routes: {
            '/startpage': (context) => const StartPage(),
            '/e-commerce': (context) => const HomePage(),
            '/community': (context) => const Home(),
            '/add': (context) => const Add(),
            '/profile': (context) => const Profile(),
            '/edit': (context) => const Edit(),
            '/replies': (context) => const Replies(),
            '/dashboard': (context) => const Dashboard(),
            '/weather': (context) => const WeatherPage(),
            '/news': (context) => const NewsPage(),
            '/soiltesting': (context) => const SoilTesting(),
            '/cropcare': (context) => const Crop(),
            '/cart': (context) => const CartScreen(),
            '/category': (context) => const CategoryScreen(),
            '/apmc': (context) => const ApmcPage(),
            '/myorders': (context) => const OrdersScreen(),
            '/whislist': (context) => const WhishlistScreen()
          });
    }
  }
}
