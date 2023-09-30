import 'package:feedapp/pages/account_page.dart';
import 'package:feedapp/pages/topic_page.dart';
import 'package:flutter/material.dart';
import 'package:feedapp/pages/create_page.dart';
import 'package:feedapp/pages/flood_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FloodPage(),
    TrendTopicPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _pages[_currentIndex],
        ],
      ),
      bottomNavigationBar: ClipRRect(
      
        child: BottomNavigationBar(
          items: [
            buildBottomNavigationBarItem(Icons.flood, 'Flood'),
            buildBottomNavigationBarItem(Icons.tag, 'Topic'),
            buildBottomNavigationBarItem(Icons.account_box, 'Account'),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.cyan[400],
      icon: Column(
        children: [
          Icon(icon),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
      label: '',
    );
  }
}