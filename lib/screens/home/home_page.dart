// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/screens/auth/sign_in_page.dart';
import 'package:food_delivery_ecommerce/screens/auth/sign_up_page.dart';
import 'package:food_delivery_ecommerce/screens/cart/cart_history_page.dart';
import 'package:food_delivery_ecommerce/screens/home/main_food_page.dart';
import 'package:food_delivery_ecommerce/screens/accounts/profile_page.dart';
import 'package:food_delivery_ecommerce/screens/home/test_page.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const MainFoodPage(),
    //const SignUpPage(),
    Container(
      child: const Center(child: Text('History Page')),
    ),
    const CartHistoryPage(),
    const ProfilePage(),
    const TestPage(),
  ];

  onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTapNav,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.roller_shades_outlined), label: "Test"),
          ]),
    );
  }
}
