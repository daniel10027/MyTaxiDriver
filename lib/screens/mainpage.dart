// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore: prefer_const_constructors
import 'package:driver/brand_colors.dart';
import 'package:driver/tabs/earningstab.dart';
import 'package:driver/tabs/hometab.dart';
import 'package:driver/tabs/profiletab.dart';
import 'package:driver/tabs/ratingstab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  static const String id = "mainpage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          HomeTab(),
          // ignore: prefer_const_constructors
          EarningsTab(),
          RatingsTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Gains",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Score",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Compte",
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: BrandColors.colorIcon,
        selectedItemColor: BrandColors.colorOrange,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        onTap: onItemClicked,
      ),
    );
  }
}
