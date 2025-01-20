import 'package:flutter/material.dart';
import 'package:flutter_pro_1/instagram_screen.dart';
import 'package:flutter_pro_1/login_screen.dart';
import 'package:flutter_pro_1/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
Widget _buildBody(){
  return IndexedStack(
    index: currentIndex,
    children: [
      
      InstagramPage(),
      LoginScreen(),
      Container(color: Colors.red,),
      Container(color: Colors.red,),
      ProfileScreen(),
    ],
  );
}
 int currentIndex = 0;
  Widget _buildBottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, size: 35),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 35),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined, size: 35),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_sharp, size: 35),
          label: 'Reels',
        ),
        BottomNavigationBarItem(
          
          icon: Icon(Icons.account_circle_outlined, size: 35),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blueAccent,
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}