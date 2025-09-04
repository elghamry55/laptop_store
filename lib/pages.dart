
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptop_store/core/features/card/view/screen/card_home.dart';
import 'package:laptop_store/core/features/favorite/view/screen/favorit_home.dart';
import 'package:laptop_store/core/features/home/view/home_screen/first_home.dart';


class Pages extends StatefulWidget {
  Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
List <Widget> page = [
  FirstHome(),
  FavoritHome(),
  CardHome(),

];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff1E293B),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30,),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30),
            label: "Shopping Card",
          ),

        ],
      ),
      body: page[currentIndex],
    );
  }
}
