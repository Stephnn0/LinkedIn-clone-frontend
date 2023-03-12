import 'package:clean_arch_linkedin/features/auth/presentation/views/home_screen.dart';
import 'package:clean_arch_linkedin/features/feed/presentation/views/feed_screen.dart';
import 'package:clean_arch_linkedin/features/post/presentation/views/post_screen.dart';
import 'package:clean_arch_linkedin/features/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/storage/storage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  String? ownerId;
  Future<String> fetchId() async {
    String? ownerId = await Storage().secureStorage.read(key: 'userId');
    return ownerId!;
  }

  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    FeedScreen(),
    // Text('data'),
    PostScreen(),
    // HomeScreen(),
    // ProfileScreen(ownerId: ''),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(
          _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.phone_android),
          //   label: 'My Network',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Post',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.wallet),
          //   label: 'Jobs',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
