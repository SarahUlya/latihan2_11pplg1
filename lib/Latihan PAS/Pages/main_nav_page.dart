import 'package:flutter/material.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/cat_list_page.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/favorite_page.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/home_page1.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/profile_page.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int currentIndex = 0;

  final pages = [HomePage1(), CatListPage(), FavoritePage(), ProfilePage1()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(
            icon: Text("😸", style: TextStyle(fontSize: 24)),
            label: 'Cat',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
